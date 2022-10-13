Class {
	#name : #Room,
	#superclass : #Object,
	#instVars : [
		'surface'
	],
	#category : #PaintedHouse
}

{ #category : #accessing }
Room >> meters [

	^ surface meters
]
