"
A RoomTest is a test class for testing the behavior of Room
"
Class {
	#name : #RoomTest,
	#superclass : #TestCase,
	#instVars : [
		'room'
	],
	#category : #'PaintedHouse-Tests'
}

{ #category : #tests }
RoomTest >> test01RoomOccupyingFixedSpace [

	room := Room occupyingInMeters: 20.
	self assert: room meters equals: 20
]

{ #category : #tests }
RoomTest >> test02RoomOccupyingSurfaceBasedSpace [

	room := Room withDimensionsDeterminedBy:
		        (RectangularSurface height: 3.5 length: 2 width: 1).

	self assert: room meters equals: 21
]
