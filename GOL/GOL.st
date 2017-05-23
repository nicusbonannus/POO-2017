!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: 'gameOfLife oneCellAlive twoNeighOfOneAliveCellAlives threeNeighOfOneAliveLiveCellAlives fourNeighOfOneAliveCellAlives threeNeigOfOneDeadCellAlives field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'setup' stamp: 'SA 5/16/2017 16:46:42'!
setUp
	
	field := Rectangle origin: 0@0 corner: 3@3.
	
	oneCellAlive := GameOfLife withLiveCells: { 1@1 }  withField: field.
	
	twoNeighOfOneAliveCellAlives := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. }  withField: field.
	
	threeNeighOfOneAliveLiveCellAlives := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. }  withField: field.
	
	fourNeighOfOneAliveCellAlives := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. 0@1 } withField: field.
	
	threeNeigOfOneDeadCellAlives := GameOfLife withLiveCells: { 2@0. 1@0. 0@0 } withField: field.
	
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

!GOLTest methodsFor: 'Testing' stamp: 'SA 5/16/2017 16:52:24'!
test06CreateGameWithCellOutsideYBoundsFail

	self 
		should: [ GameOfLife withLiveCells: { 2@0. 1@0. 1@4 } withField: field ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'Testing' stamp: 'SA 5/16/2017 16:52:35'!
test07CreateGameWithCellOutsideXBoundsFail

	self 
		should: [ GameOfLife withLiveCells: { 2@0. 1@0. 4@1 } withField: field ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells field'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'public' stamp: 'HAW 5/11/2017 21:05:39'!
nextGeneration
	
	aliveCells := (aliveCells select: [ :aCell | self hasToSurvive: aCell ]) union:
		(self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ])! !


!GameOfLife methodsFor: 'private' stamp: 'SA 5/16/2017 16:50:58'!
deadCells
	
	|allCells|
	
	allCells := OrderedCollection new.
	
	0 to: (field height-1) do: [ :y |
		0 to: (field width-1) do: [ :x |
			allCells add: x@y]].
	
	^allCells difference: aliveCells ! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 19:57:05'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'private' stamp: 'SA 5/16/2017 16:09:51'!
initializeWith: aCollectionOfAliveCells withField: aField

	field := aField.
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

!GameOfLife class methodsFor: 'instance creation' stamp: 'SA 5/16/2017 16:22:08'!
withLiveCells: aCollectionOfAliveCells withField: aField
	
	(aCollectionOfAliveCells allSatisfy: [:aCell |
		(aField containsPoint: aCell)]) ifFalse: [ self error: 'celda fuera de rango' ].
	
	^self new initializeWith: aCollectionOfAliveCells withField: aField! !
