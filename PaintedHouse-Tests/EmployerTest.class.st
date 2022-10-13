"
An EmployerTest is a test class for testing the behavior of Employer
"
Class {
	#name : #EmployerTest,
	#superclass : #TestCase,
	#category : #'PaintedHouse-Tests'
}

{ #category : #'private - accessing' }
EmployerTest >> aldo [

	^ self aldoWhenSaved: 11000
]

{ #category : #'private - accessing' }
EmployerTest >> aldoWhenSaved: aSavingsAmount [

	^ Employer
		  livingIn: self house
		  hasSaved: aSavingsAmount
		  isWillingToInvestUpTo: 20 percent
]

{ #category : #'private - accessing' }
EmployerTest >> aldoWithMoreSavings [

	^ self aldoWhenSaved: 21000
]

{ #category : #'private - accessing' }
EmployerTest >> bulkPaintSpecification [

	^ PaintSpecification coveringUpTo: 2 costing: 12
]

{ #category : #'private - accessing' }
EmployerTest >> paintCanSpecification [

	^ PaintSpecification coveringUpTo: 50 costing: 500
]

{ #category : #'private - accessing' }
EmployerTest >> raul [

	^ Painter
		  costingPerSquareMeter: 70
		  calculatingTotalCostWith: [ 
			  :painter 
			  :squareMetersToPaint 
			  :paintSpecification | 
			  (painter workforceCostToPaint: squareMetersToPaint)
			  + (paintSpecification costForPainting: squareMetersToPaint) ]
]

{ #category : #tests }
EmployerTest >> test01SavingsMustBePositive [

	self
		should: [ 
			Employer
				livingIn: self house
				hasSaved: -1
				isWillingToInvestUpTo: 20 percent ]
		raise: Error
		withExceptionDo: [ :error | 
			self assert: error messageText equals: 'Savings must be positive.' ]
]

{ #category : #tests }
EmployerTest >> test02SavingsRatioMustBeBetween1And100 [

	OrderedCollection new
		add: -1;
		add: 0;
		add: 105;
		do: [ :invalidSavingsRatio | 
			self
				should: [ 
					Employer
						livingIn: self house
						hasSaved: 100
						isWillingToInvestUpTo: invalidSavingsRatio percent ]
				raise: Error
				withExceptionDo: [ :error | 
					self
						assert: error messageText
						equals: 'Savings ratio must be between 0 and 1.' ] ]
]

{ #category : #tests }
EmployerTest >> test03MoneyWillingToInvest [

	| employer |
	employer := Employer
		            livingIn: self house
		            hasSaved: 1000
		            isWillingToInvestUpTo: 20 percent.

	self assert: employer moneyWillingToInvest equals: 200
]

{ #category : #tests }
EmployerTest >> test04WhenSavingsAreNotEnoughThenPainterCannotBeHired [

	self deny: (self aldo
			 canHire: self raul
			 withPaintingSpecifiedBy: self paintCanSpecification)
]

{ #category : #tests }
EmployerTest >> test05WhenSavingsAreEnoughThenPainterCanBeHired [

	self assert: (self aldoWithMoreSavings
			 canHire: self raul
			 withPaintingSpecifiedBy: self paintCanSpecification)
]
