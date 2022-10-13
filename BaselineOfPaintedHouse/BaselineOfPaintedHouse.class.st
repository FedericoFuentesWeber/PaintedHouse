Class {
	#name : #BaselineOfPaintedHouse,
	#superclass : #BaselineOf,
	#category : #BaselineOfPaintedHouse
}

{ #category : #baselines }
BaselineOfPaintedHouse >> baseline: spec [

	<baseline>
    spec for: #common do: [	
				
        "Packages"
        spec
            package: 'PaintedHouse';
            package: 'PaintedHouse-Tests' with: [ spec requires: 'PaintedHouse' ] ].
]

{ #category : #accessing }
BaselineOfPaintedHouse >> projectClass [ 

	^ MetacelloCypressBaselineProject
]
