"
A PainterTest is a test class for testing the behavior of Painter
"
Class {
	#name : #PainterTest,
	#superclass : #TestCase,
	#category : #'PaintedHouse-Tests'
}

{ #category : #'private - accessing' }
PainterTest >> carla [

	^ Painter
		  costingPerSquareMeter: 45
		  calculatingTotalCostWith: [ :painter :squareMetersToPaint :paintCan | 
			  | factor |
			  factor := squareMetersToPaint > 25
				            ifTrue: [ 1.5 ]
				            ifFalse: [ 2 ].
			  painter paymentPerSquareMeter * squareMetersToPaint * factor ]
]

{ #category : #'private - accessing' }
PainterTest >> paintCanCovering50SquareMeters [

	^ PaintSpecification coveringUpTo: 50 costing: 500
]

{ #category : #'private - accessing' }
PainterTest >> raul [

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
PainterTest >> test01PainterPaymentPerSquareMeterMustBePositive [

	self
		should: [ 
			Painter
				costingPerSquareMeter: -15
				calculatingTotalCostWith: [ :painter :squareMeters :paintCan |  ] ]
		raise: Error
		withExceptionDo: [ :error | 
			self
				assert: error messageText
				equals: 'El costo por metro cuadrado debe ser positivo.' ]
]

{ #category : #tests }
PainterTest >> test02WorforceCost [

	self assert: (self raul workforceCostToPaint: 20) equals: 1400
]

{ #category : #tests }
PainterTest >> test03TotalCost [

	self
		assert:
		(self raul costToPaint: 20 with: self paintCanCovering50SquareMeters)
		equals: 1900
]

{ #category : #tests }
PainterTest >> test04 [

	self
		assert:
		(self carla
			 costToPaint: 25
			 with: self paintCanCovering50SquareMeters)
		equals: 2250
]

{ #category : #'private - accessing' }
PainterTest >> venancio [

	^ Painter
		  costingPerSquareMeter: 43
		  calculatingTotalCostWith: [ :painter :squareMetersToPaint :paintCan | 
			  (painter workforceCostToPaint: squareMetersToPaint)
			  + (paintCan cost / 2) ]
]
