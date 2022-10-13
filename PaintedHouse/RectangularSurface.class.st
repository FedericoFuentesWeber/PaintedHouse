Class {
	#name : #RectangularSurface,
	#superclass : #Surface,
	#instVars : [
		'height',
		'length',
		'width'
	],
	#category : #PaintedHouse
}

{ #category : #'instance creation' }
RectangularSurface class >> height: aHeight length: aLength width: aWidth [

	^ self new initializeHeight: aHeight length: aLength width: aWidth
]

{ #category : #initialization }
RectangularSurface >> initializeHeight: aHeight length: aLength width: aWidth [

	height := aHeight.
	length := aLength.
	width := aWidth
]

{ #category : #accessing }
RectangularSurface >> meters [

	^ width + length * 2 * height
]
