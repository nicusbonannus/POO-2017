'From Cuis 5.0 of 7 November 2016 [latest update: #3076] on 30 May 2017 at 7:02:45 pm'!
'Description Please enter a description for this package'!
!provides: 'Distance-Solution' 1 0!
!requires: 'Cuis-Base' 50 3076 nil!
!classDefinition: #DistancesTests category: #'Distance-Solution'!
TestCase subclass: #DistancesTests
	instanceVariableNames: 'distanceFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'DistancesTests class' category: #'Distance-Solution'!
DistancesTests class
	instanceVariableNames: ''!

!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'DistanceFactory class' category: #'Distance-Solution'!
DistanceFactory class
	instanceVariableNames: ''!

!classDefinition: #Longitude category: #'Distance-Solution'!
Object subclass: #Longitude
	instanceVariableNames: 'length unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'Longitude class' category: #'Distance-Solution'!
Longitude class
	instanceVariableNames: 'length'!


!Number methodsFor: '*Distance-Solution' stamp: 'NB 5/25/2017 18:17:55'!
Centimetros
	^ Longitude withLength: self *10! !

!Number methodsFor: '*Distance-Solution' stamp: 'NB 5/25/2017 10:32:01'!
Kilometros
	^ Longitude withLength: (self * 1000000)! !

!Number methodsFor: '*Distance-Solution' stamp: 'NB 5/25/2017 18:17:38'!
Metros
	^Longitude withLength: self * 1000! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:32:47'!
setUp
	distanceFactory := DistanceFactory new.! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:20:56'!
test01CompareOneMeterWithAnotherOneMeter
	|oneMeter anotherMeter|
	oneMeter := 1 Metros.
	anotherMeter := 1 Metros.
	self assert: oneMeter = anotherMeter 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:22:26'!
test02CompareOneMetersWithToMetersShouldReturnFalse
	|twoMeter oneMeter|
	twoMeter := 2 Metros.
	oneMeter := 1 Metros.
	self deny: twoMeter = oneMeter 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:32:36'!
test03CallMinusOneMeterToFactory
	|oneMinusMeter|
	oneMinusMeter := -1 Metros.
	self assert: oneMinusMeter = (distanceFactory oneMinusMeter) 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:36:04'!
test04CallOneCentimeterToFactory
	|oneCentimeter|
	oneCentimeter := 1 Centimetros.
	self assert: oneCentimeter = (distanceFactory oneCentimeter) 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:36:12'!
test05CallOneHundredCentimetersToFactory
	|oneHundredCentimeters|
	oneHundredCentimeters := 100 Centimetros.
	self assert: oneHundredCentimeters = (distanceFactory oneHundredCentimeters) 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:36:56'!
test06CallOneMetersToFactory
	|oneMeter|
	oneMeter := 1 Metros.
	self assert: oneMeter = (distanceFactory oneMeter) 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:40:29'!
test07CallTwoHundredCentimetersToFactory
	|twoHundredCentimeters|
	twoHundredCentimeters := 200 Centimetros .
	self assert: twoHundredCentimeters = (distanceFactory twoHundredCentimeters) 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:41:16'!
test08CallTwoMetersToFactory
	|twoMeters|
	twoMeters := 2 Metros .
	self assert: twoMeters = (distanceFactory twoMeters) 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:42:31'!
test09CallZeroMetersToFactory
	|zeroMeters|
	zeroMeters := 0 Metros .
	self assert: zeroMeters = (distanceFactory zeroMeters) 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:48:42'!
test10AddOneMeterToAnotherMeterReturnsTwoMeters
	|oneMeter twoMeters|
	oneMeter := distanceFactory oneMeter .
	twoMeters := distanceFactory twoMeters .
	self assert: (oneMeter + oneMeter) = twoMeters 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:56:33'!
test11AddTwoMeterToAnotherTwoMeterReturnsFourMeters
	|fourMeters twoMeters|
	fourMeters := 4 Metros .
	twoMeters := distanceFactory twoMeters .
	self assert: (twoMeters + twoMeters) = fourMeters 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:04:17'!
test12CompareOneHundredCentimtersToOneThousandMilimetersReturnsTrue
	|oneThoudsandMillimeters|
	oneThoudsandMillimeters := 1000 Milimetros.
	self assert: oneThoudsandMillimeters = distanceFactory oneHundredCentimeters 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:05:05'!
test13CompareOneMeterToOneHundredCentimtersReturnsTrue
	self assert: distanceFactory oneMeter = distanceFactory oneHundredCentimeters 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:08:25'!
test14RestOneMeterToTwoMetersReturnsOneMeters
	self assert: (distanceFactory twoMeters - distanceFactory oneMeter ) = distanceFactory oneMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:09:39'!
test15RestTwoMeterToFourMetersReturnsTwoMeters
	self assert: (distanceFactory fourMeters - distanceFactory twoMeters ) = distanceFactory twoMeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:15:08'!
test16RestOneHundredCentimetersToTwoMetersIsEqualsToOneThousandMillimetes
	self assert: (distanceFactory twoMeters - distanceFactory oneHundredCentimeters )= distanceFactory oneThousandMillimeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:16:56'!
test17MultiplyOneMeterPer2ReturnsTwoMeters
	self assert: (distanceFactory oneMeter * 2 )= distanceFactory twoMeters	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:17:20'!
test18MultiplyTwoMeterPer2ReturnsFourMeters
	self assert: (distanceFactory twoMeters * 2 )= distanceFactory fourMeters 	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:19:56'!
test19MultiplyTwoPer2MetersReturnsFourMeters
	self assert: (2 * distanceFactory twoMeters ) =  distanceFactory fourMeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:21:22'!
test20MultiplyTwoPer1MeterReturnsTwoMeters
	self assert: (2 * distanceFactory oneMeter ) =  distanceFactory twoMeters ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:24:52'!
test21Divide1MeterBy2ReturnsHalfMeter
	self assert: ( distanceFactory oneMeter / 2 ) =  distanceFactory halfMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:25:46'!
test22DivideTwoMeterBy2ReturnsOneMeter
	self assert: ( distanceFactory twoMeters / 2 ) =  distanceFactory oneMeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:29:48'!
test23ComparesThatOneMeterIsBiggerThenOneCentimterReturnsTrue
	self assert: distanceFactory oneMeter > distanceFactory oneCentimeter ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:32:18'!
test24CompareThatOneMeterIsBiggerThanOneKilometerReturnsFalse
	self deny: distanceFactory oneMeter > distanceFactory oneKilometer ! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:34:46'!
test25CompareThatOneMeterIsBiggerOrEqualThanOneMeterReturnsTrue
	self assert: distanceFactory oneMeter >= distanceFactory oneMeter 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:35:43'!
test26CompareThatOneMeterIsBiggerOrEqualThanTwoMeterReturnsFalse
	self deny: distanceFactory oneMeter >= distanceFactory twoMeters 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:37:14'!
test27CompareThatOneMeterIsBiggerOrEqualThanOneMeterReturnsTrue
	self assert: distanceFactory oneMeter >= distanceFactory oneCentimeter 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:39:13'!
test28CompareThatOneMeterIsLeesThanTwoMeterReturnsTrue
	self assert: distanceFactory oneMeter < distanceFactory twoMeters 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:40:30'!
test29CompareThatOneMeterIsLeesThanOneCentimeterReturnsFalse
	self deny: distanceFactory oneMeter < distanceFactory oneCentimeter 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:42:26'!
test30CompareThatOneMeterIsLessOrEqualThanOneCentimeterReturnsFalse
	self deny: distanceFactory oneMeter <= distanceFactory oneCentimeter 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:43:26'!
test31CompareThatOneMeterIsLessOrEqualThanOneMeterReturnsTrue
	self assert: distanceFactory oneMeter <= distanceFactory oneMeter 
	! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 10:45:13'!
test32CompareThatOneMeterIsLessOrEqualThanTwoMeterReturnsTrue
	self assert: distanceFactory oneMeter <= distanceFactory twoMeters! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 18:43:10'!
test33GenerateARangeFromOneMeterToTenMetersbyOneMeter
	|range|
	range := distanceFactory oneMeter to: (distanceFactory tenMeters) by: distanceFactory oneMeter .
	self assert: range size = 10! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 18:42:32'!
test34GenerateARangeFromOneMeterToTwoMetersbyTenCentimeters
	|range|
	range := distanceFactory oneMeter to: (3 Metros) by: (10 Centimetros) .
	self assert: range size = 21! !

!DistancesTests methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 18:45:10'!
test35GenerateARangeFromOneMeterToTwoMetersbyTenCentimetersAndDoSomething
	|range|
	range := OrderedCollection new.
	distanceFactory oneMeter to: (3 Metros) by: (10 Centimetros) do: [:aNumber| range add: aNumber ].
	self assert: range size = 21! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 10:08:50'!
fourMeters
	^ 4 Metros! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 10:24:10'!
halfMeter
	^(1/2) Metros ! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:24:09'!
oneCentimeter
		^1 Centimetros! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 09:35:09'!
oneHundredCentimeters
	^ 100 Centimetros ! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 10:31:01'!
oneKilometer
	^ 1 Kilometros! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 09:37:29'!
oneMeter
	^1 Metros! !

!DistanceFactory methodsFor: 'as yet unclassified' stamp: 'NB 5/25/2017 09:22:50'!
oneMinusMeter
		^-1 Metros! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 10:14:24'!
oneThousandMillimeters
	^1000 Milimetros ! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 17:56:44'!
tenMeters
	^10 Metros ! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 09:40:43'!
twoHundredCentimeters
	^200 Centimetros ! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 09:41:41'!
twoMeters
	^ 2 Metros! !

!DistanceFactory methodsFor: 'accessing' stamp: 'NB 5/25/2017 09:42:47'!
zeroMeters
	^0 Metros ! !

!Longitude methodsFor: 'arithmethics' stamp: 'NB 5/25/2017 10:18:29'!
* aNumber
	^ Longitude withLength: (aNumber * self length )! !

!Longitude methodsFor: 'arithmethics' stamp: 'NB 5/25/2017 09:52:38'!
+ aLongitude 
	^Longitude withLength: (self length + (aLongitude  length)) ! !

!Longitude methodsFor: 'arithmethics' stamp: 'NB 5/25/2017 10:11:40'!
- aLongitude 
	^ Longitude withLength: (self length - aLongitude length )! !

!Longitude methodsFor: 'arithmethics' stamp: 'NB 5/25/2017 10:26:15'!
/ aNumber 
	^ Longitude withLength: (self length / aNumber )! !

!Longitude methodsFor: 'comparing' stamp: 'NB 5/25/2017 10:41:48'!
< aLongitude 
	^(self length > aLongitude length ) not! !

!Longitude methodsFor: 'comparing' stamp: 'NB 5/25/2017 10:45:36'!
<= aLongitude 
	^self = aLongitude or: [self < aLongitude ]! !

!Longitude methodsFor: 'as yet unclassified' stamp: 'NB 5/24/2017 08:14:12'!
= anotherLongitude
	^self length = anotherLongitude length ! !

!Longitude methodsFor: 'comparing' stamp: 'NB 5/25/2017 10:32:46'!
> aLongitude 
	^self length  > aLongitude length ! !

!Longitude methodsFor: 'comparing' stamp: 'NB 5/25/2017 10:37:55'!
>= aLongitude 
	^self > aLongitude or: [self = aLongitude ]
	! !

!Longitude methodsFor: 'arithmethics' stamp: 'NB 5/25/2017 10:22:16'!
adaptToNumber: aNumber andSend: aSymbol 
	^ Longitude withLength: (self length * aNumber )! !

!Longitude methodsFor: 'accessing' stamp: 'NB 5/25/2017 18:18:32'!
length
	^length! !

!Longitude methodsFor: 'accessing' stamp: 'NB 5/24/2017 08:13:21'!
length: aLength 
	length := aLength! !

!Longitude methodsFor: 'accessing' stamp: 'NB 5/25/2017 18:02:53'!
to: aLongitude 
	^ self length to: aLongitude length by: 1! !

!Longitude methodsFor: 'accessing' stamp: 'NB 5/25/2017 18:42:00'!
to: aLongitude by: aStep 
	^ self length to: aLongitude length by: aStep length ! !

!Longitude methodsFor: 'accessing' stamp: 'NB 5/25/2017 18:46:19'!
to: aLongitude by: aStep do: aBlockClosure 
	self length to: aLongitude length by: aStep length do: aBlockClosure ! !

!Longitude methodsFor: 'accessing' stamp: 'NB 5/25/2017 18:09:21'!
unit: anUnit
	unit := anUnit ! !

!Longitude class methodsFor: 'initialization' stamp: 'NB 5/25/2017 18:16:20'!
withLength: aLength
	|newLongitude|
	newLongitude := self new.
	newLongitude length: aLength .
	^newLongitude.
	! !

!Longitude class methodsFor: 'initialization' stamp: 'NB 5/25/2017 18:08:48'!
withLength: aLength andUnit: anUnit
	|newLongitude|
	newLongitude := self new.
	newLongitude length: aLength .
	newLongitude unit: anUnit.
	^newLongitude.
	! !
