!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NB 5/4/2017 21:06:24'!
test11Pop2ItemsAndGetSizeShouldReturn2

	| stack pushedObject anotherObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	anotherObject := 'Another'.
	
	stack push: pushedObject.
	stack push: anotherObject.
	
	self assert: stack size = 2.! !


!classDefinition: #MissingOOStackItem category: #'Stack-Exercise'!
Object subclass: #MissingOOStackItem
	instanceVariableNames: 'nextItem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!MissingOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/4/2017 19:45:31'!
addFollowing: anItem
	nextItem := anItem ! !

!MissingOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 10:58:15'!
count
	^0! !

!MissingOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 10:47:59'!
data
	^ self error: OOStack stackEmptyErrorDescription ! !

!MissingOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 10:46:08'!
nextItem
	^self error: OOStack stackEmptyErrorDescription ! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastItem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'protocols' stamp: 'NB 5/6/2017 11:24:48'!
initialize
	self lastItem: MissingOOStackItem new! !

!OOStack methodsFor: 'protocols' stamp: 'NB 5/4/2017 20:05:39'!
isEmpty
	^ lastItem isKindOf: MissingOOStackItem ! !

!OOStack methodsFor: 'protocols' stamp: 'NB 5/4/2017 19:50:15'!
lastItem: anItem
	lastItem := anItem ! !

!OOStack methodsFor: 'protocols' stamp: 'NB 5/4/2017 20:21:58'!
pop
	|currentLastItem|
	currentLastItem := lastItem. 
	lastItem := currentLastItem nextItem .
	^currentLastItem data ! !

!OOStack methodsFor: 'protocols' stamp: 'NB 5/6/2017 11:25:56'!
push: anItem
	lastItem := ConcreteOOStackItem newWithData: anItem andNextItem: lastItem ! !

!OOStack methodsFor: 'protocols' stamp: 'NB 5/6/2017 10:59:00'!
size
	^lastItem count! !

!OOStack methodsFor: 'protocols' stamp: 'NB 5/4/2017 20:25:25'!
top
	^lastItem data ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackItem category: #'Stack-Exercise'!
Object subclass: #OOStackItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:19:58'!
addFollowing: anItem
	self subclassResponsibility ! !

!OOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:21:15'!
count
	self subclassResponsibility ! !

!OOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:21:39'!
data
	self subclassResponsibility ! !

!OOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:22:05'!
nextItem
	self subclassResponsibility ! !


!classDefinition: #ConcreteOOStackItem category: #'Stack-Exercise'!
OOStackItem subclass: #ConcreteOOStackItem
	instanceVariableNames: 'nextItem data'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ConcreteOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:01:10'!
addFollowing: anItem
	nextItem := anItem ! !

!ConcreteOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:20:45'!
count
	^ 1+ nextItem count ! !

!ConcreteOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:01:34'!
data
	^data ! !

!ConcreteOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:01:41'!
data: aData
	data := aData ! !

!ConcreteOOStackItem methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:01:50'!
nextItem
	^nextItem ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConcreteOOStackItem class' category: #'Stack-Exercise'!
ConcreteOOStackItem class
	instanceVariableNames: ''!

!ConcreteOOStackItem class methodsFor: 'as yet unclassified' stamp: 'NB 5/6/2017 11:24:27'!
newWithData: aString andNextItem: anItem 	
	|newItem|
	newItem := self new.
	newItem data: aString.
	newItem addFollowing: anItem. 
	^newItem ! !
