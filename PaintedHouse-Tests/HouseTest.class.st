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
