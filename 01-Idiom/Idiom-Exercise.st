!classDefinition: #NotFound category: #'Idiom-Exercise'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!


!classDefinition: #IdiomTest category: #'Idiom-Exercise'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!IdiomTest methodsFor: 'testing' stamp: 'NB 4/23/2017 14:31:54'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| aGivenOperation expectedDurationOfOperation customerBook|
	customerBook := CustomerBook  new.
	aGivenOperation := [customerBook addCustomerNamed: 'John Lennon'].
	expectedDurationOfOperation := 50.
	self checkThat: aGivenOperation  takesLessThan: expectedDurationOfOperation 	
! !

!IdiomTest methodsFor: 'testing' stamp: 'NB 4/23/2017 14:36:53'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

     | customerBook paulMcCartney expectedOperationDuration aGivenOperation|
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	aGivenOperation := [customerBook removeCustomerNamed: paulMcCartney].
	expectedOperationDuration := 100.
	
	self checkThat: aGivenOperation  takesLessThan: expectedOperationDuration
	

! !

!IdiomTest methodsFor: 'testing' stamp: 'NB 4/23/2017 14:58:17'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook aGivenOperation expectedErrorType expectedCondition|
	customerBook := CustomerBook new.

	aGivenOperation := [customerBook addCustomerNamed: ''].
	expectedCondition := [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty].
	
	expectedErrorType := Error.
		
	self checkThat: aGivenOperation throws: expectedErrorType andAsserts: expectedCondition ! !

!IdiomTest methodsFor: 'testing' stamp: 'NB 4/23/2017 15:01:16'!
test04CanNotRemoveAndInvalidCustomer
	
	| customerBook johnLennon aGivenOperation expectedErrorType expectedCondition|
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	aGivenOperation := [customerBook removeCustomerNamed: 'Paul McCartney'].
	expectedErrorType := NotFound.
	expectedCondition =  [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	
	self checkThat: aGivenOperation   throws: expectedErrorType  andAsserts: expectedCondition! !


!IdiomTest methodsFor: 'Private' stamp: 'NB 4/25/2017 14:57:55'!
checkThat: anOperation takesLessThan: amountOfMilliseconds	
	| millisecondsBeforeRunning millisecondsAfterRunning |	
	millisecondsBeforeRunning := Time millisecondClockValue.
	anOperation value.
	millisecondsAfterRunning := Time millisecondClockValue.

	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < amountOfMilliseconds.! !

!IdiomTest methodsFor: 'Private' stamp: 'NB 4/25/2017 14:58:29'!
checkThat: anOperation throws: anErrorType andAsserts: someConditions
	[ anOperation value.
	self fail ]
		on: anErrorType 
		do: someConditions ! !


!classDefinition: #CustomerBook category: #'Idiom-Exercise'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'Idiom-Exercise'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
