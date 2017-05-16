!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: 'gameOfLife oneCellAlive twoNeighOfOneAliveCellAlives threeNeighOfOneAliveLiveCellAlives fourNeighOfOneAliveCellAlives threeNeigOfOneDeadCellAlives'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'setup' stamp: 'SA 5/16/2017 15:26:47'!
setUp

	oneCellAlive := GameOfLife withLiveCells: { 1@1 }  withSize: 3@3.
	
	twoNeighOfOneAliveCellAlives := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. }  withSize: 3@3.
	
	threeNeighOfOneAliveLiveCellAlives := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. }  withSize: 3@3.
	
	fourNeighOfOneAliveCellAlives := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. 0@1 } withSize: 3@3.
	
	threeNeigOfOneDeadCellAlives := GameOfLife withLiveCells: { 2@0. 1@0. 0@0 } withSize: 3@3.
	
	! !


!GOLTest methodsFor: 'Testing' stamp: 'SA 5/16/2017 15:27:11'!
test01AliveCellWithLessThanTwoAliveNeighDies

	oneCellAlive nextGeneration.
	
	self assert: (oneCellAlive isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'SA 5/16/2017 15:27:21'!
test02AliveCellWithTwoAliveNeighStaysAlive

	twoNeighOfOneAliveCellAlives nextGeneration.
	
	self assert: (twoNeighOfOneAliveCellAlives isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'SA 5/16/2017 15:27:26'!
test03AliveCellWithThreeAliveNeighStaysAlive

	threeNeighOfOneAliveLiveCellAlives nextGeneration.
	
	self assert: (threeNeighOfOneAliveLiveCellAlives isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'SA 5/16/2017 15:27:31'!
test04AliveCellWithMoreThanThreeAliveNeighDies

	fourNeighOfOneAliveCellAlives nextGeneration.
	
	self assert: (fourNeighOfOneAliveCellAlives isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'SA 5/16/2017 15:27:36'!
test05DeadCellWithThreeAliveNeighResurects

	threeNeigOfOneDeadCellAlives nextGeneration.
	
	self assert: (threeNeigOfOneDeadCellAlives isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'HAW 5/11/2017 20:59:58'!
test06CreateCellOutsideBounds

	self 
		should: [ GameOfLife withLiveCells: { 2@0. 1@0. 1@4 } withSize: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'public' stamp: 'HAW 5/11/2017 21:05:39'!
nextGeneration
	
	aliveCells := (aliveCells select: [ :aCell | self hasToSurvive: aCell ]) union:
		(self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ])! !


!GameOfLife methodsFor: 'private' stamp: 'HAW 5/12/2017 09:10:31'!
deadCells
	
	| deadCells |
	
	deadCells _ OrderedCollection new.
	0 to: size x do: [ :x |
		0 to: size y do: [ :y |
			(aliveCells includes: x@y) not ifTrue: [ deadCells add: x@y]]].
	^deadCells ! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 19:57:05'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/9/2017 20:53:16'!
initializeWith: aCollectionOfAliveCells 

	aliveCells := aCollectionOfAliveCells ! !

!GameOfLife methodsFor: 'private' stamp: 'SA 5/16/2017 15:10:05'!
initializeWith: aCollectionOfAliveCells withSize: aSize

	size := aSize.
	aliveCells := aCollectionOfAliveCells.! !

!GameOfLife methodsFor: 'private' stamp: 'sa 5/16/2017 14:20:57'!
isAliveAt: aCell

	^aliveCells includes: aCell! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/10/2017 10:28:24'!
isDeadAt: aCell

	^(aliveCells includes: aCell) not! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/10/2017 10:29:35'!
numberOfAliveNeighboursOf: aCell

	^(aCell eightNeighbors intersection: aliveCells) size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!

!GameOfLife class methodsFor: 'instance creation' stamp: 'HAW 5/9/2017 20:52:29'!
withLiveCells: aCollectionOfAliveCells

	^self new initializeWith: aCollectionOfAliveCells ! !

!GameOfLife class methodsFor: 'instance creation' stamp: 'SA 5/16/2017 15:10:03'!
withLiveCells: aCollectionOfAliveCells withSize: aPoint 
	
	(aCollectionOfAliveCells allSatisfy: [:aCell |
		(aCell x between: 0 and: aPoint x) and: [ aCell y between: 0 and: aPoint y]]) ifFalse: [ self error: 'celda fuera de rango' ].
	
	^self new initializeWith: aCollectionOfAliveCells withSize: aPoint ! !
