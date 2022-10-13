Class {
	#name : #Painter,
	#superclass : #Object,
	#instVars : [
		'paymentPerSquareMeter',
		'totalCostCalculation'
	],
	#category : #PaintedHouse
}

{ #category : #'instance creation' }
Painter class >> costingPerSquareMeter: anAmount calculatingTotalCostWith: aTotalCostCalculation [

	anAmount negative ifTrue: [ 
		Error signal:
			'El costo por metro cuadrado debe ser positivo.' ].

	^ self new
		  initializePaymentPerSquareMeterOf: anAmount
		  calculatingTotalCostWith: aTotalCostCalculation
]

{ #category : #accessing }
Painter >> costToPaint: squareMeters with: aPaintCan [

	^ totalCostCalculation
		  value: self
		  value: squareMeters
		  value: aPaintCan
]

{ #category : #initialization }
Painter >> initializePaymentPerSquareMeterOf: anAmount calculatingTotalCostWith: aTotalCostCalculation [

	paymentPerSquareMeter := anAmount.
	totalCostCalculation := aTotalCostCalculation
]

{ #category : #accessing }
Painter >> paymentPerSquareMeter [

	^ paymentPerSquareMeter
]

{ #category : #accessing }
Painter >> workforceCostToPaint: squareMeters [

	^ self paymentPerSquareMeter * squareMeters
]
