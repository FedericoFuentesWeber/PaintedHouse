"
A HouseTest is a test class for testing the behavior of House
"
Class {
	#name : #HouseTest,
	#superclass : #TestCase,
	#category : #'PaintedHouse-Tests'
}

{ #category : #tests }
HouseTest >> test01HouseMustBeConformedByAtLeastOneRoom [

	self
		should: [ House conformedByAll: #(  ) ]
		raise: Error
		withExceptionDo: [ :error | 
			self
				assert: error messageText
				equals: 'A house must be conformed by, at least, one room.' ]
]

{ #category : #tests }
HouseTest >> test02HouseConformedByOneRoom [

	| bedroom house |
	bedroom := Room occupyingInMeters: 20.
	house := House conformedBy: bedroom.
	self assert: house meters equals: 20
]

{ #category : #tests }
HouseTest >> test03HouseConformedByManyRooms [

	| bedroom kitchen house |
	bedroom := Room occupyingInMeters: 20.
	kitchen := Room occupyingInMeters: 21.
	house := House conformedByAll: (Array with: bedroom with: kitchen).
	self assert: house meters equals: 41
]
