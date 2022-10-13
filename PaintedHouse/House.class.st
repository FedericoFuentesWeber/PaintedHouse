Class {
	#name : #House,
	#superclass : #Object,
	#instVars : [
		'rooms'
	],
	#category : #PaintedHouse
}

{ #category : #'instance creation' }
House class >> conformedBy: aRoom [

	^ self conformedByAll: (Array with: aRoom)
]

{ #category : #'instance creation' }
House class >> conformedByAll: aCollectionOfRooms [

	aCollectionOfRooms size strictlyPositive ifFalse: [ 
		Error signal: 'A house must be conformed by, at least, one room.' ].

	^ self new initializeConformedByAll: aCollectionOfRooms
]

{ #category : #initialization }
House >> initializeConformedByAll: aCollectionOfRooms [

	rooms := aCollectionOfRooms
]

{ #category : #accessing }
House >> meters [

	^ rooms sumNumbers: [ :room | room meters ]
]
