!classDefinition: #DistancesTests category: #Distances!
TestCase subclass: #DistancesTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distances'!

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 15:23:12'!
test01CompareThatOneMetroToOneMetroAreEqualShouldReturnTrue
	|unMetro otroMetro|
	unMetro := Metro withLength: 1.
	otroMetro := Metro withLength: 1.
	self assert: unMetro = otroMetro! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 15:23:26'!
test02CompareThatOneMetroAndTwoMetrosAreEqualShouldReturnFalse
	|oneMetro twoMetros|
	oneMetro := Metro withLength: 1.
	twoMetros := Metro withLength: 2.
	self deny: oneMetro = twoMetros! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 15:23:42'!
test03SumOneMetroToAnotherMetroShoudlBeEqualsToTwoMetros
	|oneMetro twoMetros|
	oneMetro := Metro withLength: 1.
	twoMetros := Metro withLength: 2.
	self assert: (oneMetro + oneMetro) = twoMetros! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 15:23:57'!
test04SumOneMetroToTwoMetrosShouldBeEqualsToThreeMetros
	|oneMetro twoMetros threeMetros|
	oneMetro := Metro withLength: 1.
	twoMetros := Metro withLength: 2.
	threeMetros := Metro withLength: 3.
	self assert: (oneMetro + twoMetros) = threeMetros! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:12:31'!
test05CompareOneMetroWithOneHundredCentimetersShouldReturnTrue
	|oneMetro oneHundredCentimetros|
	oneMetro := Metro withLength: 1.
	oneHundredCentimetros := Centimetro withLength: 100.
	self assert: oneMetro = oneHundredCentimetros ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:13:50'!
test06CompareOneMetroWithTwoHundredCentimetersShouldReturnFalse
	|oneMetro twoHundredCentimetros|
	oneMetro := Metro withLength: 1.
	twoHundredCentimetros := Centimetro withLength: 200.
	self deny: oneMetro = twoHundredCentimetros ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:16:57'!
test07CompareOneHundredCentimetersWithOneMetroShouldReturnTrue
	|oneMetro oneHundredCentimetros|
	oneMetro := Metro withLength: 1.
	oneHundredCentimetros := Centimetro withLength: 100.
	self assert: oneHundredCentimetros = oneMetro ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:25:13'!
test08SumOneCentimeterWithOneCentimeterShouldReturnTwoCentimeters
	|oneCentimeter anotherCentimeter twoCentimeter|
	oneCentimeter := Centimetro withLength: 1.
	anotherCentimeter := Centimetro withLength: 1.
	twoCentimeter := Centimetro withLength: 2.
	self assert: (oneCentimeter + anotherCentimeter ) = twoCentimeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:34:32'!
test09RestOneCentimeterToTwoCentimeterShouldReturnOneCentimeter
	|twoCentimeter oneCentimeter anotherCentimeter|
	twoCentimeter := Centimetro withLength: 2.
	oneCentimeter := Centimetro withLength: 1.
	anotherCentimeter := Centimetro withLength: 1.
	self assert: (twoCentimeter - oneCentimeter ) = anotherCentimeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:36:36'!
test10RestOneCentimeterToThreeCentimeterShouldReturnTwoCentimeter
	|twoCentimeter oneCentimeter threeCentimeter|
	twoCentimeter := Centimetro withLength: 2.
	oneCentimeter := Centimetro withLength: 1.
	threeCentimeter := Centimetro withLength: 3.
	self assert: (threeCentimeter - oneCentimeter ) = twoCentimeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:42:25'!
test11RestOneMeterToThreeMetersShouldReturnTwoMeters
	|twoMeters oneMeter threeMeters|
	twoMeters := Metro withLength: 2.
	oneMeter := Metro withLength: 1.
	threeMeters := Metro withLength: 3.
	self assert: (threeMeters - oneMeter ) = twoMeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:58:49'!
test12MultiplyTwoByOneMeterShouldReturnTwoMeters
	|oneMeter twoMeters|
	oneMeter := Metro withLength: 1.
	twoMeters := Metro withLength: 2.
	self assert: (2*oneMeter ) = twoMeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 18:59:08'!
test13MultiplyTwoByTwoMetersShouldReturnFourMeter
	|fourMeter twoMeters|
	fourMeter := Metro withLength: 4.
	twoMeters := Metro withLength: 2.
	self assert: (2*twoMeters ) = fourMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 19:00:58'!
test14MultiplyTwoByTwoCentimetersShouldReturnFourCentimeters
	|fourCentimeters twoCentimeters|
	fourCentimeters := Centimetro withLength: 4.
	twoCentimeters := Centimetro withLength: 2.
	self assert: (2*twoCentimeters ) = fourCentimeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 19:02:21'!
test15MultiplyTwoCentimetersbyTwoShouldReturnFourCentimeters
	|fourCentimeters twoCentimeters|
	fourCentimeters := Centimetro withLength: 4.
	twoCentimeters := Centimetro withLength: 2.
	self assert: (twoCentimeters *2 ) = fourCentimeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 19:03:51'!
test16MultiplyOneCentimeterbyTwoShouldReturnTwoCentimeter
	|oneCentimeters twoCentimeters|
	oneCentimeters := Centimetro withLength: 1.
	twoCentimeters := Centimetro withLength: 2.
	self assert: (oneCentimeters *2 ) = twoCentimeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 19:05:23'!
test17MultiplyOneMeterbyTwoShouldReturnTwoMeter
	|oneMeter twoMeters|
	oneMeter := Metro withLength: 1.
	twoMeters := Metro withLength: 2.
	self assert: (oneMeter *2 ) = twoMeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 20:45:52'!
test18DivideOneMetroByTwoReturnsHalfMeter
	|oneMeter halfMeter|
	oneMeter := Metro withLength: 1.
	halfMeter := Metro withLength: 1/2.
	self assert: (oneMeter / 2 ) = halfMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 20:47:57'!
test19DivideTwoMetersByTwoReturnsOneMeter
	|oneMeter twoMeters|
	oneMeter := Metro withLength: 1.
	twoMeters := Metro withLength: 2.
	self assert: (twoMeters / 2 ) = oneMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 20:48:57'!
test20DivideTwoCentimetersByTwoReturnsOneCentimeter
	|oneCentimeter twoCentimeters|
	oneCentimeter := Centimetro withLength: 1.
	twoCentimeters := Centimetro withLength: 2.
	self assert: (twoCentimeters / 2 ) = oneCentimeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 20:53:42'!
test21CompareThatTenKilometersAreMoreThanOneMeterReturnsTrue
	|oneMeter tenKilometers|
	oneMeter := Metro withLength: 1.
	tenKilometers := Kilometro withLength: 10..
	self assert: tenKilometers > oneMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 20:59:02'!
test22CompareThatTenKilometersAreLessThanOneMeterReturnsFalse
	|oneMeter tenKilometers|
	oneMeter := Metro withLength: 1.
	tenKilometers := Kilometro withLength: 10.
	self deny: tenKilometers < oneMeter! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 21:06:31'!
test23CompareThatOneKilometersAreLessThanTwoKilometerReturnsTrue
	|oneKilometer twoKilometers|
	oneKilometer := Kilometro withLength: 1.
	twoKilometers := Kilometro withLength: 2.
	self assert: oneKilometer < twoKilometers! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 11:41:53'!
test24CompareThatOneHundredCentimetersAreLessThanTwoKilometerReturnsTrue
	|oneHundredCentimeters twoKilometers|
	oneHundredCentimeters := Centimetro withLength: 100.
	twoKilometers := Kilometro withLength: 2.
	self assert: oneHundredCentimeters < twoKilometers! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 11:45:16'!
test25CompareThatOneMeterIsMoraOrEqualToMeterReturnsTrue
	|oneMeter anotherMeter|
	oneMeter := Metro withLength: 1.
	anotherMeter := Metro withLength: 1.
	self assert: oneMeter >= anotherMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 11:49:03'!
test26CompareThatOneMeterIsMoreOrEqualToTwoMetersReturnsFalse
	|oneMeter twoMeter|
	oneMeter := Metro withLength: 1.
	twoMeter := Metro withLength: 2.
	self deny: oneMeter >= twoMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 11:58:08'!
test27CompareThatOneMeterIsLessOrEqualToTwoMetersReturnsTrue
	|oneMeter twoMeter|
	oneMeter := Metro withLength: 1.
	twoMeter := Metro withLength: 2.
	self assert: oneMeter <= twoMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 12:06:20'!
test28CompareThatTwoMeterIsLessOrEqualToOneMetersReturnsFalse
	|oneMeter twoMeter|
	oneMeter := Metro withLength: 1.
	twoMeter := Metro withLength: 2.
	self deny: twoMeter <= oneMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 12:02:13'!
test29CompareThatOneMeterIsLessOrEqualToOneMetersReturnsTrue
	|oneMeter anotherMeter|
	oneMeter := Metro withLength: 1.
	anotherMeter := Metro withLength: 1.
	self assert: anotherMeter <= oneMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 15:06:06'!
test30GenerateAListFromOneMetroToThreeMetrosReturnsAListWithThreeElements
	|oneMeter threeMeters listOfMeters|
	oneMeter := Metro withLength: 1.
	threeMeters := Metro withLength: 3.
	listOfMeters := oneMeter to: threeMeters.
	self assert: (listOfMeters size ) = 3.
	self assert: (listOfMeters at: 1) length = 1.
	self assert: (listOfMeters at: 2) length = 2.
	self assert: (listOfMeters at: 3) length = 3.! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 15:07:17'!
test31GenerateAListFromOneMetroToTwoMetrosReturnsAListWithTwoElements
	|oneMeter twoMeters listOfMeters|
	oneMeter := Metro withLength: 1.
	twoMeters := Metro withLength: 2.
	listOfMeters := oneMeter to: twoMeters.
	self assert: (listOfMeters size ) = 2.
	self assert: (listOfMeters at: 1) length = 1.
	self assert: (listOfMeters at: 2) length = 2.! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 15:25:13'!
test32GenerateAListFromOneCentimeterToFourCentimeterShoudlReturnsAListOfFourElements
	|oneCentimeter foutCentimeters listOfCentimeters|
	oneCentimeter := Centimetro withLength: 1.
	foutCentimeters := Centimetro withLength: 4.
	listOfCentimeters := oneCentimeter to: foutCentimeters.
	self assert: (listOfCentimeters size ) = 4.
	self assert: (listOfCentimeters at: 1) length = 1.
	self assert: (listOfCentimeters at: 2) length = 2.
	self assert: (listOfCentimeters at: 3) length = 3.
	self assert: (listOfCentimeters at: 4) length = 4.! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/21/2017 15:40:40'!
test33GenerateAListFromTwoCentimeterToOneCentimeterShoudlRaiseAnException
	|oneCentimeter twoCentimeters|
	oneCentimeter := Centimetro withLength: 1.
	twoCentimeters := Centimetro withLength: 2.
	self 
		should: [ twoCentimeters to: oneCentimeter  ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'la distancia final debe ser mayor que la inicial' ]! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:16:17'!
test34ConvertOneMetroIntoCentimetros
	|oneMeter oneHundredCentimeters|
	oneMeter := Metro withLength: 1.
	oneHundredCentimeters := oneMeter convertInto: Centimetro.
	self assert: oneHundredCentimeters length = 100.
	self assert: oneHundredCentimeters class = Centimetro.
	
	
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:20:31'!
test35ConvertTwoMetroIntoCentimetros
	|twoMeters oneHundredCentimeters|
	twoMeters := Metro withLength: 2.
	oneHundredCentimeters := twoMeters convertInto: Centimetro.
	self assert: oneHundredCentimeters length = 200.
	self assert: oneHundredCentimeters class = Centimetro.
	
	
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:34:45'!
test36ConvertTwoMetersIntoMillimeters
	|twoMeters twoThousandCentimeters|
	twoMeters := Metro withLength: 2.
	twoThousandCentimeters := twoMeters convertInto: Milimetro .
	self assert: twoThousandCentimeters length = 2000.
	self assert: twoThousandCentimeters class = Milimetro.
	
	
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:49:41'!
test37Convert100CentimetersInto1Meter
	|oneMeter oneHundredCentimeters|
	oneHundredCentimeters := Centimetro withLength: 100.
	oneMeter := oneHundredCentimeters convertInto: Metro .
	self assert: oneMeter length = 1.
	self assert: oneMeter class = Metro.
	
	
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:50:33'!
test38GenerateAListFromTwoCentimeterToOneMeterWithoutPassingAStepShoudlRaiseAnException
	|oneMeter twoCentimeters|
	oneMeter := Metro withLength: 1.
	twoCentimeters := Centimetro withLength: 2.
	self 
		should: [ twoCentimeters to: oneMeter  ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'ambas medidas deben ser del mismo tipo' ]! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 21:55:58'!
test39GenerateAListFromOneMeterToTwoMetersWithStepOfTenCentimetersReturnsAListWithElevenItems
	|oneMeter twoMeters tenCentimeters listOfDistances|
	oneMeter := Metro withLength: 1.
	twoMeters := Metro withLength: 2.
	tenCentimeters := Centimetro withLength: 10.
	listOfDistances := oneMeter to: twoMeters by: tenCentimeters.
	self assert: (listOfDistances size ) = 11.
	self assert: (listOfDistances at: 1) length = 100.
	self assert: (listOfDistances at: 1) class = Centimetro.
	self assert: (listOfDistances at: 11) length = 200.! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 21:50:51'!
test40GenerateAListFromOneMeterToTwoHundredDecimetersReturnsAListOf21Items
	|oneMeter twoHundredDecimters tenCentimeters listOfDistances|
	oneMeter := Metro withLength: 1.
	twoHundredDecimters := Decimetro withLength: 20.
	tenCentimeters := Centimetro withLength: 10.
	listOfDistances := oneMeter to: twoHundredDecimters by: tenCentimeters.
	self assert: (listOfDistances size ) = 11.
	self assert: (listOfDistances at: 1) length = 100.
	self assert: (listOfDistances at: 11) length = 200. ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 22:00:51'!
test41AddAnItemWhenGoingFromTwoDistancesReturnsAList
	|oneMeter twoHundredDecimeters tenCentimeters listOfDistances|
	oneMeter := Metro withLength: 1.
	twoHundredDecimeters := Decimetro withLength: 20.
	tenCentimeters := Centimetro withLength: 10.
	listOfDistances := OrderedCollection new.
	oneMeter to: twoHundredDecimeters by: tenCentimeters do: [:item | listOfDistances add: item].
	self assert: (listOfDistances size ) = 11.! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/23/2017 19:02:07'!
test42
	|oneMeter twoDecimeters oneMeterAndTwoCentimeters|
	oneMeter := Metro withLength: 1.
	twoDecimeters := Decimetro withLength: 2.
	oneMeterAndTwoCentimeters := Centimetro withLength: (1+(2/10)).
	self assert: (oneMeter + twoDecimeters) = oneMeterAndTwoCentimeters! !


!classDefinition: #Longitud category: #Distances!
Object subclass: #Longitud
	instanceVariableNames: 'length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distances'!

!Longitud methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 15:32:37'!
length
	^length ! !

!Longitud methodsFor: 'as yet unclassified' stamp: 'NB 5/20/2017 15:32:49'!
length: anInteger 
	length := anInteger ! !

!Longitud methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:26:10'!
millimeters
	^length * (self class classMillimeters )! !


!Longitud methodsFor: 'arithmetics' stamp: 'NB 5/20/2017 19:05:41'!
* aSmallInteger 
	^ self class withLength: (aSmallInteger * length )! !

!Longitud methodsFor: 'arithmetics' stamp: 'NB 5/20/2017 18:22:47'!
+ anotherDistance 
	^ (self class) withLength: (length + anotherDistance length )! !

!Longitud methodsFor: 'arithmetics' stamp: 'NB 5/20/2017 18:42:57'!
- aDistance 
	^self class withLength: (self length - aDistance length )! !

!Longitud methodsFor: 'arithmetics' stamp: 'NB 5/20/2017 20:49:14'!
/ aSmallInteger 
	^ self class withLength: (length / aSmallInteger )! !

!Longitud methodsFor: 'arithmetics' stamp: 'NB 5/20/2017 19:01:37'!
adaptToNumber: aSmallInteger andSend: aSymbol 
	^ self class withLength: (length * aSmallInteger )! !


!Longitud methodsFor: 'comparing' stamp: 'NB 5/21/2017 11:56:58'!
< aMetro 
	^(self > aMetro) not ! !

!Longitud methodsFor: 'comparing' stamp: 'NB 5/21/2017 12:05:53'!
<= aMetro 
	^ (self < aMetro) or: [self = aMetro]! !

!Longitud methodsFor: 'comparing' stamp: 'NB 5/20/2017 18:10:38'!
= anotherDistance
	^ self millimeters  = anotherDistance millimeters ! !

!Longitud methodsFor: 'comparing' stamp: 'NB 5/20/2017 20:54:45'!
> aDistance 
	^ self millimeters > aDistance millimeters ! !

!Longitud methodsFor: 'comparing' stamp: 'NB 5/21/2017 11:53:35'!
>= aMetro 
	^ (self > aMetro) or: [self = aMetro]! !


!Longitud methodsFor: 'associating' stamp: 'NB 5/22/2017 22:05:30'!
to: aLongitude
	|listOfLongitudes|
	(self <= aLongitude) ifFalse: [ self error: 'la distancia final debe ser mayor que la inicial' ].
	(self class = aLongitude class) ifFalse: [self error: 'ambas medidas deben ser del mismo tipo'].
	listOfLongitudes := OrderedCollection new.
	self to: aLongitude  by: (self class withLength: 1)  do: [:aNumber | listOfLongitudes add: (self class withLength: aNumber )].
	^ listOfLongitudes ! !

!Longitud methodsFor: 'associating' stamp: 'NB 5/22/2017 22:03:31'!
to: aDistance by: aStep 
	|listOfLongitudes|
	listOfLongitudes := OrderedCollection new.
	self to: aDistance  by: aStep  do:  [:aNumber | listOfLongitudes add: (aStep class withLength: aNumber )]. 
	^ listOfLongitudes ! !


!Longitud methodsFor: 'converting' stamp: 'NB 5/22/2017 20:36:22'!
convertInto: aLongitudeClass 
	^aLongitudeClass withLength: (length * ( self class classMillimeters / aLongitudeClass classMillimeters ))! !


!Longitud methodsFor: 'evaluating' stamp: 'NB 5/22/2017 21:58:52'!
to: aDistance by: aStep do: aBlockClosure 
	|initialDistance finalDistance listOfLongitudes|
	initialDistance := self convertInto: aStep class.
	finalDistance := aDistance convertInto: aStep class.
	listOfLongitudes := OrderedCollection new.
	(initialDistance length to: finalDistance length by: aStep length ) do: aBlockClosure.
	^ listOfLongitudes ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Longitud class' category: #Distances!
Longitud class
	instanceVariableNames: ''!

!Longitud class methodsFor: 'class initialization' stamp: 'NB 5/22/2017 20:22:13'!
classMillimeters
	^self subclassResponsibility ! !

!Longitud class methodsFor: 'class initialization' stamp: 'NB 5/20/2017 18:03:07'!
withLength: anInteger 
	^self new length: anInteger
	! !


!classDefinition: #Centimetro category: #Distances!
Longitud subclass: #Centimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distances'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimetro class' category: #Distances!
Centimetro class
	instanceVariableNames: ''!

!Centimetro class methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:24:36'!
classMillimeters
	^10! !


!classDefinition: #Decimetro category: #Distances!
Longitud subclass: #Decimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distances'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Decimetro class' category: #Distances!
Decimetro class
	instanceVariableNames: ''!

!Decimetro class methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 21:43:40'!
classMillimeters
	^100! !


!classDefinition: #Kilometro category: #Distances!
Longitud subclass: #Kilometro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distances'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Kilometro class' category: #Distances!
Kilometro class
	instanceVariableNames: ''!

!Kilometro class methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:23:14'!
classMillimeters
	^1000000! !


!classDefinition: #Metro category: #Distances!
Longitud subclass: #Metro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distances'!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Metro class' category: #Distances!
Metro class
	instanceVariableNames: ''!

!Metro class methodsFor: 'initialization' stamp: 'NB 5/22/2017 20:25:19'!
classMillimeters
	^1000! !


!classDefinition: #Milimetro category: #Distances!
Longitud subclass: #Milimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distances'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimetro class' category: #Distances!
Milimetro class
	instanceVariableNames: ''!

!Milimetro class methodsFor: 'as yet unclassified' stamp: 'NB 5/22/2017 20:24:54'!
classMillimeters
	^1! !
