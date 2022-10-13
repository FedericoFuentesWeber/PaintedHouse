Class {
	#name : #Employer,
	#superclass : #Object,
	#instVars : [
		'house',
		'savingsAmount',
		'savingsRatio'
	],
	#category : #PaintedHouse
}

{ #category : #'instance creation' }
Employer class >> livingIn: aHouse hasSaved: aSavingsAmount isWillingToInvestUpTo: aSavingsRatio [

	aSavingsAmount negative ifTrue: [ 
		Error signal: 'Savings must be positive.' ].

	(aSavingsRatio > 0 and: [ aSavingsRatio <= 1 ]) ifFalse: [ 
		Error signal: 'Savings ratio must be between 0 and 1.' ].

	^ self new
		  initializeLivingIn: aHouse
		  hasSaved: aSavingsAmount
		  isWillingToInvestUpTo: aSavingsRatio
]

{ #category : #testing }
Employer >> canHire: aPainter withPaintingSpecifiedBy: aPaintCanSpecification [

	^ self moneyWillingToInvest
	  >=
	  (aPainter costToPaint: house meters with: aPaintCanSpecification)
]

{ #category : #initialization }
Employer >> initializeLivingIn: aHouse hasSaved: aSavingsAmount isWillingToInvestUpTo: aSavingsRatio [

	house := aHouse.
	savingsAmount := aSavingsAmount.
	savingsRatio := aSavingsRatio
]

{ #category : #accessing }
Employer >> moneyWillingToInvest [

	^ savingsAmount * savingsRatio
]
