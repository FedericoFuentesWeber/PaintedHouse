Class {
	#name : #PaintSpecificationTest,
	#superclass : #TestCase,
	#category : #'PaintedHouse-Tests'
}

{ #category : #tests }
PaintSpecificationTest >> test01PaintCostMustBeStrictlyPositive [

	self 
		should: [ PaintSpecification coveringUpTo: 100 costing: -15 ]
		raise: Error
		withExceptionDo: [ :error | self assert: error messageText equals: 'Cost must be strictly positive.' ]
]

{ #category : #tests }
PaintSpecificationTest >> test02PaintCoveredSquareMetersMustBeStrictlyPositive [

	self 
		should: [ PaintSpecification coveringUpTo: -100 costing: 15 ]
		raise: Error
		withExceptionDo: [ :error | self assert: error messageText equals: 'Covered square meters must be strictly positive.' ]
]
