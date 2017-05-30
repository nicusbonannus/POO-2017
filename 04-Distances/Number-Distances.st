'From Cuis 5.0 of 7 November 2016 [latest update: #3076] on 30 May 2017 at 4:34:50 pm'!


!Number methodsFor: '*Distances' stamp: 'NB 5/25/2017 18:17:55'!
Centimetros
	^ Longitude withLength: self *10! !

!Number methodsFor: '*Distances' stamp: 'NB 5/25/2017 10:32:01'!
Kilometros
	^ Longitude withLength: (self * 1000000)! !

!Number methodsFor: '*Distances' stamp: 'NB 5/25/2017 18:17:38'!
Metros
	^Longitude withLength: self * 1000! !
	
!Number methodsFor: '*Distances' stamp: 'NB 5/25/2017 18:17:38'!
Milimetros
	^Longitude withLength: self! !
