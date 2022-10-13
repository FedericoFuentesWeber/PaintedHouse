Class {
	#name : #PaintSpecification,
	#superclass : #Object,
	#instVars : [
		'coveredSquareMeters',
		'cost'
	],
	#category : #PaintedHouse
}

{ #category : #'private - asserting' }
PaintSpecification class >> assertIsStrictlyPositive: aNumber knownAs: aDescription [

	aNumber strictlyPositive ifFalse: [ 
		Error signal:
			('<1s> must be strictly positive.' expandMacrosWith: aDescription) ]
]

{ #category : #'instance creation' }
PaintSpecification class >> coveringUpTo: aCoveredSquareMeters costing: anAmount [

	self
		assertIsStrictlyPositive: aCoveredSquareMeters
		knownAs: 'Covered square meters';
		assertIsStrictlyPositive: anAmount knownAs: 'Cost'.

	^ self new
		  initializeCoveringUpTo: aCoveredSquareMeters
		  costing: anAmount
]

{ #category : #accessing }
PaintSpecification >> cost [

	^ cost
]

{ #category : #accessing }
PaintSpecification >> costForPainting: squareMetersToPaint [

	^ (squareMetersToPaint / coveredSquareMeters) ceiling * cost
]

{ #category : #initialization }
PaintSpecification >> initializeCoveringUpTo: aCoveredSquareMeters costing: anAmount [

	coveredSquareMeters := aCoveredSquareMeters.
	cost := anAmount
]
