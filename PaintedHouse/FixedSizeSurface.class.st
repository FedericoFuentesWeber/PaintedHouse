Class {
	#name : #FixedSizeSurface,
	#superclass : #Surface,
	#instVars : [
		'meters'
	],
	#category : #PaintedHouse
}

{ #category : #'instance creation' }
FixedSizeSurface class >> of: aNumberOfMeters [

	^ self new initializeOf: aNumberOfMeters
]

{ #category : #initialization }
FixedSizeSurface >> initializeOf: aNumberOfMeters [

	meters := aNumberOfMeters
]

{ #category : #accessing }
FixedSizeSurface >> meters [

	^ meters
]
