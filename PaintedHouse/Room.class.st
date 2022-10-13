Class {
	#name : #Room,
	#superclass : #Object,
	#instVars : [
		'surface'
	],
	#category : #PaintedHouse
}

{ #category : #'instance creation' }
Room class >> occupyingInMeters: aNumberOfMeters [


	^ self withDimensionsDeterminedBy:
		  (FixedSizeSurface of: aNumberOfMeters)
]

{ #category : #'instance creation' }
Room class >> withDimensionsDeterminedBy: aSurface [

	^ self new initializeWithDimensionsDeterminedBy: aSurface
]

{ #category : #initialization }
Room >> initializeWithDimensionsDeterminedBy: aSurface [

	surface := aSurface
]

{ #category : #accessing }
Room >> meters [

	^ surface meters
]
