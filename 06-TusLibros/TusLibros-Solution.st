!classDefinition: #TestService category: #'TusLibros-Solution'!
TestCase subclass: #TestService
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TestService methodsFor: 'as yet unclassified' stamp: 'NB 6/25/2017 16:58:05'!
setUp
	factory := YourBooksFactory new.! !

!TestService methodsFor: 'as yet unclassified' stamp: 'NB 6/25/2017 18:38:33'!
test01CreateACart
	|service accountsManager cart cartId|
	accountsManager := factory anAccountManager.
	service := factory aServiceWithAccountManager: accountsManager.
	cartId := service createCartForId: 'tango' andPassword: 'fox'.
	cart := service listCartWithId: cartId.
	self assert: (cart size) = 0! !

!TestService methodsFor: 'as yet unclassified' stamp: 'NB 6/25/2017 17:53:03'!
test02CreateACartWithANonExistentUserThrowsAnError
	|service accountsManager |
	accountsManager := factory anAccountManager.
	service := factory aServiceWithAccountManager: accountsManager .
	
	[service createCartForId: 'twentycentury' andPassword: 'fox'.] 
	on: Error 
	do:  [ :anError | self assert: anError messageText = AccountManager wrongPasswordOrUser ].
! !

!TestService methodsFor: 'as yet unclassified' stamp: 'NB 6/25/2017 17:56:08'!
test03CreateACartWithAWrongPasswordThrowsAnError
	|service accountsManager |
	accountsManager := factory anAccountManager.
	service := factory aServiceWithAccountManager: accountsManager .
	
	[service createCartForId: 'tango' andPassword: 'milonga'.] 
	on: Error 
	do:  [ :anError | self assert: anError messageText = AccountManager wrongPasswordOrUser ].
! !

!TestService methodsFor: 'as yet unclassified' stamp: 'NB 6/25/2017 18:40:52'!
test04AddAnItemToCatalog
	|service accountsManager cart cartId |
	accountsManager := factory anAccountManager .
	service := factory aServiceWithAccountManager: accountsManager .
	cartId := factory aCartForService: service.
	service addToCartWithId: cartId anItemWithIsbn: 123 withQuantity: 1.
	
	cart := service listCartWithId: cartId.
	self assert: (cart size) = 1! !

!TestService methodsFor: 'as yet unclassified' stamp: 'NB 6/26/2017 20:27:36'!
test05CheckoutSale
	|creditCard service accountsManager cartId clientId listOfPurchases password |
	accountsManager := factory anAccountManager .
	clientId := 'tango'.
	password := 'fox'.
	service := factory aServiceWithAccountManager: accountsManager .
	cartId := service createCartForId: clientId andPassword: password .
	service addToCartWithId: cartId anItemWithIsbn: 123 withQuantity: 1.	
	creditCard := factory aCard .

	service checkoutCardWithId: cartId andCreditCard: creditCard andClient: clientId.
	
	listOfPurchases := service listPurchasesForClient: clientId withPassword: password.
	self assert: (listOfPurchases size) = 1! !


!classDefinition: #Tests category: #'TusLibros-Solution'!
TestCase subclass: #Tests
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/11/2017 09:56:57'!
setUp
	factory := YourBooksFactory new! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:54:54'!
test01CalculatePricesFor2BooksWithSameISBN
	|cart book anotherBook cashier|
	cart := factory aCart.
	book := factory aBook.
	anotherBook := factory aBook.
	cashier := factory aCashier.
	cart add: book.
	cart add: anotherBook .
	self assert: (cashier totalFor: cart) = 20! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:55:00'!
test02CalculatePriceForACartWith2DifferentBooks
	|cart book cashier anotherBook |
	cart := factory aCart.
	book := factory aBook.
	anotherBook := factory anotherBook .
	cashier := factory aCashier.
	cart add: book withAmount: 2.
	cart add: anotherBook withAmount: 1.
	self assert: (cashier totalFor: cart) = 31! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/26/2017 20:13:31'!
test03CheckoutAnEmptyChartShouldRaiseException
	|cart card cashier salesBook|
	salesBook := factory aSalesBook.
	cart := factory aCart.
	card := factory aCard .
	cashier := factory aCashierWithSalesBook: salesBook forDate: factory pastDate .
	self assert: (salesBook size) = 0.
	[cashier checkout: cart withCard: card forClient: 1. self fail] on: Error do:  [ :anError | self assert: anError messageText = Cashier cannotCheckoutAnEmptyCart ].
	self assert: (salesBook size) = 0.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/26/2017 20:13:57'!
test04CheckoutACart
	|cart cashier salesBook catalog product currentDate merchantProcessor|
	product := factory aBook.
	currentDate := factory pastDate.
	merchantProcessor := factory fakeMP.
	salesBook := factory aSalesBook.
	cart := factory aCart.
	catalog := factory aCatalog .
	cart add: product .
	cashier := factory  aCashierWithSalesBook: salesBook forDate: currentDate andMerchantProcessor: merchantProcessor andCatalog: catalog.
	self assert: (salesBook size ) = 0.
	
	cashier checkout: cart withCard: factory aCard forClient: 1 .
	
	self assert: (salesBook size) = 1.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:57:28'!
test05CheckIfProductThatIsIntheCatalogIsInTheCatalogReturnsTrue
	|catalog product|
	catalog := factory aCatalog .
	product := factory aProduct.
	self assert: (catalog has: product)! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:57:40'!
test06CheckIfProductThatIsNotInTheCatalogIsInTheCatalogReturnsFalse
	|catalog product|
	catalog := factory aCatalog .
	product := factory aProductNotInTheCatalog .
	self deny: (catalog has: product)! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/25/2017 17:49:59'!
test07CreateACardWithoutAnExpirationMonthShouldRaiseError
	|expirationMonth|
	expirationMonth := ''. 
	[Card forNumber: 1234567890123456 andExpiration: expirationMonth andName: 'jack daniels'. self fail] 
	on: Error 
	do:  [ :anError | self assert: anError messageText = Card cannotCreateACardWithoutExpiration ].! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:58:10'!
test08CreateACardWithoutClientNameShouldRaiseAnException
	|expirationMonth|
	expirationMonth := Month month: 12 year: 2017. 
	[Card forNumber: 1234567890123456 andExpiration: expirationMonth andName: ''. self fail] 
	on: Error 
	do:  [ :anError | self assert: anError messageText = Card cannotCreateACardWithoutClientName ].! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/26/2017 20:20:54'!
test09CheckOutWithExpiredCardShouldRaiseAnException
	|card cart expiratonMonth currentDate cashier |
	cart := factory aCart.
	cart add: factory aBook .
	expiratonMonth := Month month: 10 year: 2017. 
	currentDate := Date year: 2017 month: 12 day: 19. 
	card := Card forNumber: 1234567890123456 andExpiration: expiratonMonth andName:'JOSE CANTINFLAS'.
	cashier := Cashier forDate: currentDate withSalesBook: factory aSalesBook .
	[cashier checkout: cart withCard: card  forClient: 1. self fail] 
	on: Error 
	do:  [ :anError | self assert: anError messageText = Cashier cannotPayWithExpiredCard ].! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:58:35'!
test10CheckIfExpiredCardIsExpiredReturnsTrue
	|card expiratonMonth currentDate|
	expiratonMonth := Month month: 10 year: 2017. 
	currentDate := Date year: 2017 month: 12 day: 19. 
	card := Card forNumber: 1234567890123456 andExpiration: expiratonMonth andName:'JOSE CANTINFLAS'.
	self assert: (card isExpiredFor: currentDate )! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:58:42'!
test11CheckIfUnexpiredCardIsExpiredReturnsFalse
	|card expiratonMonth currentDate|
	expiratonMonth := Month month: 12 year: 2017. 
	currentDate := Date year: 2017 month: 10 day: 19. 
	card := Card forNumber: 1234567890123456 andExpiration: expiratonMonth andName:'JOSE CANTINFLAS'.
	self deny: (card isExpiredFor: currentDate )! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/26/2017 20:21:12'!
test12PayWithStollenCreditCardThrownsAnExpception
	|merchantProcessor card cashier currentDate salesBook|
	salesBook := factory aSalesBook .
	card := factory aCard.
	currentDate := Date year: 2017 month: 2 day: 19. 
	merchantProcessor := factory fakeMP.
	merchantProcessor payMethod: [^self error: MerchantProcessor cannotPayWithStollenCreditCard].
	cashier := factory aCashierWithSalesBook: salesBook forDate: currentDate  andMerchantProcessor: merchantProcessor  andCatalog: factory aCatalog.
	
	[cashier checkout: factory aCartWithBooks withCard: card forClient: 1. self fail] 
	on: Error 
	do:  [ :anError | self assert: anError messageText = MerchantProcessor cannotPayWithStollenCreditCard].
	
	self assert: (salesBook size ) = 0
	
	! !

!Tests methodsFor: 'as yet unclassified' stamp: 'NB 6/26/2017 20:21:25'!
test13PayWithACreditCardWithoutMoneyThrowsAnExcepcion
	|merchantProcessor card cashier currentDate salesBook|
	salesBook := factory aSalesBook .
	card := factory aCard.
	currentDate := Date year: 2017 month: 2 day: 19. 
	merchantProcessor := factory fakeMP.
	merchantProcessor payMethod: [^self error: MerchantProcessor cannotPayWithoutMoney].
	cashier := factory aCashierWithSalesBook: salesBook forDate: currentDate  andMerchantProcessor: merchantProcessor  andCatalog: factory aCatalog.
	
	[cashier checkout: factory aCartWithBooks withCard: card forClient: 1. self fail] 
	on: Error 
	do:  [ :anError | self assert: anError messageText = MerchantProcessor cannotPayWithoutMoney].
	
	self assert: (salesBook size ) = 0
	
	! !


!classDefinition: #TestsCart category: #'TusLibros-Solution'!
TestCase subclass: #TestsCart
	instanceVariableNames: 'factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TestsCart methodsFor: 'as yet unclassified' stamp: 'NB 6/17/2017 15:35:10'!
setUp
	factory := YourBooksFactory new.! !

!TestsCart methodsFor: 'as yet unclassified' stamp: 'NB 6/17/2017 15:35:39'!
test01AddOneProductToCart
		|cart product|
		cart := factory aCart.
		product := factory aProduct .
		cart add: product.
		self assert: cart amount = 1! !

!TestsCart methodsFor: 'as yet unclassified' stamp: 'NB 6/17/2017 15:35:56'!
test02AddAProductTwoTimesToCart
	|cart product anotherProduct |
	cart := factory aCart.
	product := factory aBook.
	anotherProduct := factory anotherBook.
	cart add: product.
	cart add: anotherProduct.
	self assert: cart amount = 2! !

!TestsCart methodsFor: 'as yet unclassified' stamp: 'NB 6/17/2017 15:36:08'!
test03AddTwoBooksOfSameISBN
	|cart book |
	cart := factory aCart.
	book := factory aBook.
	cart add: book.
	cart add: book.
	self assert: cart amount = 2! !

!TestsCart methodsFor: 'as yet unclassified' stamp: 'NB 6/22/2017 18:55:39'!
test04AddAProductThatIsNotInTheCatalogShouldRaiseException
	|cart product |
	product := factory aProductNotInTheCatalog.
	cart := factory aCart.	
	self assert: (cart amount ) = 0.

	[cart add: product. self fail] on: Error do:  [ :anError | self assert: anError messageText = Cart cannotAddAProductThatDoesNotBelongToCompany ].

	self assert: (cart amount ) = 0.! !


!classDefinition: #AccountManager category: #'TusLibros-Solution'!
Object subclass: #AccountManager
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!AccountManager methodsFor: 'accessing' stamp: 'NB 6/25/2017 17:17:32'!
accounts: aDictionary 
	accounts := aDictionary ! !


!AccountManager methodsFor: 'inspecting' stamp: 'NB 6/25/2017 17:55:26'!
checkIfExists: anId with: aPassword 
	|password|
	password := accounts at: anId ifAbsent:  [self error: AccountManager wrongPasswordOrUser].
	(password = aPassword ) ifFalse: [self error: AccountManager wrongPasswordOrUser]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountManager class' category: #'TusLibros-Solution'!
AccountManager class
	instanceVariableNames: ''!

!AccountManager class methodsFor: 'initialization' stamp: 'NB 6/25/2017 17:17:13'!
newWithAccounts: aDictionary
	|accountManager|
	accountManager := self new.
	accountManager accounts: aDictionary .
	^accountManager ! !


!AccountManager class methodsFor: 'message handling' stamp: 'NB 6/25/2017 17:53:28'!
wrongPasswordOrUser
	'Wrong user or password dude'! !


!classDefinition: #Card category: #'TusLibros-Solution'!
Object subclass: #Card
	instanceVariableNames: 'number expiration name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Card methodsFor: 'accessing' stamp: 'NB 6/17/2017 15:46:11'!
expiration: aMonth 
	expiration := aMonth ! !

!Card methodsFor: 'accessing' stamp: 'NB 6/17/2017 15:46:33'!
name: aString 
	name := aString! !

!Card methodsFor: 'accessing' stamp: 'NB 6/17/2017 15:45:57'!
number: aSmallInteger 
	number := aSmallInteger ! !


!Card methodsFor: 'validation' stamp: 'NB 6/17/2017 15:52:28'!
isExpiredFor: aDate 
	^(aDate monthIndex >= expiration monthIndex ) and: [aDate yearNumber >= expiration yearNumber ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: #'TusLibros-Solution'!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'message handling' stamp: 'NB 6/17/2017 15:28:56'!
cannotCreateACardWithoutClientName
	^'Cannot create a card without client name'! !

!Card class methodsFor: 'message handling' stamp: 'NB 6/17/2017 15:24:44'!
cannotCreateACardWithoutExpiration
	^'Cannot create a card without an expiration month'! !


!Card class methodsFor: 'initialization' stamp: 'NB 6/17/2017 15:29:54'!
forNumber: aSmallInteger andExpiration: aMonth andName: aString 
	|card|
	(aMonth isMemberOf: Month) ifFalse: [^ self error: self cannotCreateACardWithoutExpiration ].
	(aString isEmpty ) ifTrue: [^ self error: self cannotCreateACardWithoutClientName ].
	card := self new.
	card number: aSmallInteger.
	card expiration: aMonth.
	card name: aString.
	^card
	! !


!classDefinition: #Cart category: #'TusLibros-Solution'!
Object subclass: #Cart
	instanceVariableNames: 'books catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'accessing' stamp: 'NB 6/16/2017 21:55:33'!
add: aProduct
	self add: aProduct withAmount: 1! !

!Cart methodsFor: 'accessing' stamp: 'NB 6/16/2017 21:55:42'!
add: aProduct withAmount: aSmallInteger 
	(catalog has: aProduct ) ifFalse: [self error: Cart cannotAddAProductThatDoesNotBelongToCompany ].
	books add: aProduct withOccurrences: aSmallInteger ! !

!Cart methodsFor: 'accessing' stamp: 'NB 6/15/2017 20:13:55'!
amount
	^ books size! !

!Cart methodsFor: 'accessing' stamp: 'NB 6/11/2017 23:48:50'!
books
	^books! !

!Cart methodsFor: 'accessing' stamp: 'NB 6/16/2017 21:23:31'!
catalog: aCatalog 
	catalog := aCatalog ! !

!Cart methodsFor: 'accessing' stamp: 'NB 6/15/2017 20:10:27'!
initialize
	books := Bag new! !

!Cart methodsFor: 'accessing' stamp: 'NB 6/25/2017 17:28:46'!
products
	^books ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Solution'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'accessing' stamp: 'NB 6/11/2017 10:39:01'!
cannotAddEmptyAmountOfBooks
	^'La cantidad de libros a agregar debe ser positiva'! !


!Cart class methodsFor: 'message handling' stamp: 'NB 6/16/2017 20:42:59'!
cannotAddAProductThatDoesNotBelongToCompany
	^'Cannot add a product to the cart that does not belong to the company'! !


!Cart class methodsFor: 'initialization' stamp: 'NB 6/16/2017 21:22:56'!
forCatalog: aCatalog 
	|cart|
	cart := self new.
	cart catalog: aCatalog .
	^cart! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: 'prices catalog salesBook currentDate merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'accessing' stamp: 'NB 6/15/2017 19:52:54'!
catalog: aCatalog 
	catalog := aCatalog ! !

!Cashier methodsFor: 'accessing' stamp: 'NB 6/17/2017 15:56:46'!
currentDate: aDate 
	currentDate := aDate ! !

!Cashier methodsFor: 'accessing' stamp: 'NB 6/22/2017 19:17:17'!
merchantProcessor: aMerchantProcessor 
	merchantProcessor := aMerchantProcessor ! !

!Cashier methodsFor: 'accessing' stamp: 'NB 6/11/2017 23:41:40'!
prices: aDictionary 
	prices := aDictionary ! !

!Cashier methodsFor: 'accessing' stamp: 'NB 6/25/2017 19:05:13'!
salesBook
	^salesBook ! !

!Cashier methodsFor: 'accessing' stamp: 'NB 6/16/2017 20:19:49'!
salesBook: aSalesBook 
	salesBook := aSalesBook ! !

!Cashier methodsFor: 'accessing' stamp: 'NB 6/16/2017 19:15:20'!
totalFor: aCart 
	|total|
	total := 0.
	aCart books contents keysDo: [:product| total :=  total +((aCart books occurrencesOf: product) *( catalog listOfPrices at: product code)) ].
	^total.	
	! !


!Cashier methodsFor: 'transaction' stamp: 'NB 6/26/2017 20:19:11'!
checkout: aCart withCard: aCard forClient: clientId
	|total|
	(aCart amount = 0) ifTrue: [self error: self class cannotCheckoutAnEmptyCart ].
	(aCard isExpiredFor: currentDate ) ifTrue: [self error: self class cannotPayWithExpiredCard ].
	total := self totalFor: aCart.
	merchantProcessor payWithCreditCard: aCard  anAmountOf: total.
	salesBook add: (Sale forClient: clientId withTotal: total).
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: 'prices catalog'!

!Cashier class methodsFor: 'initialization' stamp: 'NB 6/17/2017 15:56:32'!
forDate: aDate withSalesBook: anOrderedCollection 
	|cashier|
	cashier := self new.
	cashier currentDate: aDate.
	cashier salesBook: anOrderedCollection .
	^cashier 
	
	! !

!Cashier class methodsFor: 'initialization' stamp: 'NB 6/22/2017 19:17:38'!
forDate: aDate withSalesBook: aSalesBook andMerchantProcessor: aMerchantProcessor 
	|cashier|
	cashier := self new.
	cashier salesBook: aSalesBook.
	cashier currentDate: aDate .
	cashier merchantProcessor: aMerchantProcessor.
	^cashier! !

!Cashier class methodsFor: 'initialization' stamp: 'NB 6/22/2017 19:30:23'!
forDate: aDate withSalesBook: aSalesBook andMerchantProcessor: aMerchantProcessor andCatalog: aCatalog 
	|cashier|
	cashier := self new.
	cashier currentDate: aDate.
	cashier salesBook: aSalesBook .
	cashier merchantProcessor: aMerchantProcessor .
	cashier catalog: aCatalog .
	^ cashier! !

!Cashier class methodsFor: 'initialization' stamp: 'NB 6/15/2017 19:52:20'!
withCatalog: aCatalog 
	|cashier|
	cashier := self new.
	cashier catalog: aCatalog.
	^cashier ! !

!Cashier class methodsFor: 'initialization' stamp: 'NB 6/16/2017 20:19:31'!
withSalesBook: aSalesBook 
	|cashier|
	cashier := self new.
	cashier salesBook: aSalesBook .
	^cashier! !



!Cashier class methodsFor: 'message handling' stamp: 'NB 6/16/2017 20:22:09'!
cannotCheckoutAnEmptyCart
	^'No se puede hacer checkout de un carrito vacio'! !

!Cashier class methodsFor: 'message handling' stamp: 'NB 6/17/2017 15:57:19'!
cannotPayWithExpiredCard
	^'Cannot pay an order with an expired credit card'! !


!classDefinition: #Catalog category: #'TusLibros-Solution'!
Object subclass: #Catalog
	instanceVariableNames: 'listOfPrices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Catalog methodsFor: 'as yet unclassified' stamp: 'NB 6/15/2017 19:46:30'!
initialize
	listOfPrices := Dictionary new! !


!Catalog methodsFor: 'accessing' stamp: 'NB 6/16/2017 21:51:43'!
has: aProduct 
	^self listOfPrices keys includes: aProduct code ! !

!Catalog methodsFor: 'accessing' stamp: 'NB 6/15/2017 19:50:17'!
listOfPrices: aDictionary 
	listOfPrices := aDictionary ! !


!Catalog methodsFor: 'associating' stamp: 'NB 6/15/2017 19:53:59'!
listOfPrices
	^listOfPrices ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalog class' category: #'TusLibros-Solution'!
Catalog class
	instanceVariableNames: ''!

!Catalog class methodsFor: 'initialization' stamp: 'NB 6/15/2017 19:49:49'!
withListOfPrices: aDictionary 
	|catalog|
	catalog := self new.
	catalog listOfPrices: aDictionary.
	^catalog ! !


!classDefinition: #FakeMerchantProcessor category: #'TusLibros-Solution'!
Object subclass: #FakeMerchantProcessor
	instanceVariableNames: 'payMethod'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!FakeMerchantProcessor methodsFor: 'as yet unclassified' stamp: 'NB 6/24/2017 16:18:39'!
payMethod: aClosure
	payMethod := aClosure ! !

!FakeMerchantProcessor methodsFor: 'as yet unclassified' stamp: 'NB 6/24/2017 16:17:27'!
payWithCreditCard: aCard anAmountOf: anAmount
	^ payMethod value
! !


!classDefinition: #MerchantProcessor category: #'TusLibros-Solution'!
Object subclass: #MerchantProcessor
	instanceVariableNames: 'payMethod'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!MerchantProcessor methodsFor: 'as yet unclassified' stamp: 'NB 6/24/2017 16:16:59'!
payWithCreditCard: aCreditCard anAmountOf: anAmount
	^NotYetImplemented ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: #'TusLibros-Solution'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'message handling' stamp: 'NB 6/24/2017 16:39:52'!
cannotPayWithStollenCreditCard
	'This Card is STOLEN'! !

!MerchantProcessor class methodsFor: 'message handling' stamp: 'NB 6/25/2017 16:34:52'!
cannotPayWithoutMoney
	^'Cannot pay with a creditcard without money'! !


!classDefinition: #Product category: #'TusLibros-Solution'!
Object subclass: #Product
	instanceVariableNames: 'code'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Product methodsFor: 'accessing' stamp: 'NB 6/15/2017 20:23:30'!
= anotherProduct
	^self code = anotherProduct code ! !

!Product methodsFor: 'accessing' stamp: 'NB 6/15/2017 19:33:10'!
code
	^code! !

!Product methodsFor: 'accessing' stamp: 'NB 6/15/2017 19:32:55'!
code: aSmallInteger 
	code := aSmallInteger ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Product class' category: #'TusLibros-Solution'!
Product class
	instanceVariableNames: ''!


!Product class methodsFor: 'initialization' stamp: 'NB 6/15/2017 19:32:21'!
withCode: aSmallInteger 
	|product|
	product := self new.
	product code: aSmallInteger.
	^product ! !



!classDefinition: #Sale category: #'TusLibros-Solution'!
Object subclass: #Sale
	instanceVariableNames: 'client total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Sale methodsFor: 'accessing' stamp: 'NB 6/26/2017 20:31:20'!
client
	^client ! !

!Sale methodsFor: 'accessing' stamp: 'NB 6/26/2017 20:20:08'!
client: aSmallInteger 
	client := aSmallInteger ! !

!Sale methodsFor: 'accessing' stamp: 'NB 6/26/2017 20:20:20'!
total: aSmallInteger 
	total := aSmallInteger ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #'TusLibros-Solution'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'as yet unclassified' stamp: 'NB 6/26/2017 20:18:36'!
forClient: aClient withTotal: aTotal
	|sale|
	sale := self new.
	sale client: aClient .
	sale total: aTotal .
	^sale! !


!classDefinition: #SalesBook category: #'TusLibros-Solution'!
Object subclass: #SalesBook
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!SalesBook methodsFor: 'accessing' stamp: 'NB 6/16/2017 20:21:21'!
initialize
	sales := OrderedCollection new! !

!SalesBook methodsFor: 'accessing' stamp: 'NB 6/16/2017 20:21:37'!
total
	^ sales size! !


!SalesBook methodsFor: 'as yet unclassified' stamp: 'NB 6/16/2017 20:35:44'!
add: aSale 
	self shouldBeImplemented! !


!classDefinition: #Service category: #'TusLibros-Solution'!
Object subclass: #Service
	instanceVariableNames: 'accountsManager cart catalog carts cashier'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Service methodsFor: 'associating' stamp: 'NB 6/25/2017 17:22:10'!
accountsManager: anAccountManager 
	accountsManager := anAccountManager ! !


!Service methodsFor: 'accessing' stamp: 'NB 6/25/2017 18:34:38'!
addToCartWithId: anId anItemWithIsbn: aString withQuantity: anAmount 
	|cart|
	cart := carts at: anId.
	cart add: (Product withCode: aString)  withAmount: anAmount! !

!Service methodsFor: 'accessing' stamp: 'NB 6/25/2017 19:02:17'!
cashier: aCashier 
	cashier := aCashier 	! !

!Service methodsFor: 'accessing' stamp: 'NB 6/25/2017 18:39:30'!
catalog: aCatalog 
	catalog := aCatalog ! !

!Service methodsFor: 'accessing' stamp: 'NB 6/25/2017 18:36:55'!
createCartForId: anId andPassword: aPassword
	|cartId|
	accountsManager checkIfExists: anId with: aPassword.
	cartId :=  carts size.
	cart := Cart forCatalog: catalog.
	carts at: cartId put: cart.
	^cartId ! !

!Service methodsFor: 'accessing' stamp: 'NB 6/25/2017 17:35:11'!
initialize
	carts := Dictionary new.! !

!Service methodsFor: 'accessing' stamp: 'NB 6/25/2017 17:35:48'!
listCartWithId: cartID 
	^(carts at: cartID ) products ! !

!Service methodsFor: 'accessing' stamp: 'NB 6/26/2017 20:31:06'!
listPurchasesForClient: aClientId withPassword: password
	accountsManager checkIfExists: aClientId with: password.
	^(cashier salesBook select: [:sale| sale client = aClientId ])! !


!Service methodsFor: 'shopping' stamp: 'NB 6/26/2017 20:27:58'!
checkoutCardWithId: carId andCreditCard: aCreditCard andClient: clientID
	cashier checkout: (carts at: carId) withCard: aCreditCard forClient: clientID .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Service class' category: #'TusLibros-Solution'!
Service class
	instanceVariableNames: ''!

!Service class methodsFor: 'initialization' stamp: 'NB 6/25/2017 18:37:19'!
withAccountManager: anAccountManager  andCatalog: aCatalog
	|service|
	service := self new.
	service accountsManager: anAccountManager .
	service catalog: aCatalog .
	^service! !

!Service class methodsFor: 'initialization' stamp: 'NB 6/25/2017 19:01:52'!
withAccountManager: anAccountManager  andCatalog: aCatalog andCashier: aCashier
	|service|
	service := self new.
	service accountsManager: anAccountManager .
	service catalog: aCatalog .
	service cashier: aCashier .
	^service! !


!classDefinition: #YourBooksFactory category: #'TusLibros-Solution'!
Object subclass: #YourBooksFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/15/2017 18:50:55'!
aBook
	^Product withCode: 123! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/17/2017 15:33:51'!
aCard
	^Card forNumber: 1234567890123456 andExpiration: (Month month: 12 year: 2017) andName: 'JOHNNY WALKER'! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/18/2017 17:15:20'!
aCart
	^Cart forCatalog: (self aCatalog) ! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/15/2017 19:39:41'!
aCartWithBooks
	|cart|
	cart := self aCart .
	cart add: self aBook withAmount: 1.
	cart add: self anotherBook withAmount: 1.
	^cart! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/15/2017 19:48:42'!
aCashier
	^Cashier withCatalog: self aCatalog ! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/15/2017 19:48:20'!
aCatalog
	|listOfPrices|
	listOfPrices := Dictionary new.
	listOfPrices at: 123 put: 10.
	listOfPrices at: 321 put: 11.
	^Catalog withListOfPrices: listOfPrices! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/16/2017 21:33:38'!
aProduct
	^Product withCode: 123! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/16/2017 20:41:39'!
aProductNotInTheCatalog
	^Product withCode: 5432! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/16/2017 20:36:11'!
aSalesBook
	^OrderedCollection new! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/25/2017 19:01:12'!
aServiceWithAccountManager: anAccountManager 
	|cashier currentDate|
	currentDate := Date year: 2016 month: 1 day: 1.
	cashier := self aCashierWithSalesBook: (self aSalesBook ) forDate: currentDate  
	andMerchantProcessor: (self fakeMP)  andCatalog: (self aCatalog ).
	^Service withAccountManager: anAccountManager andCatalog: (self aCatalog ) andCashier: cashier! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/15/2017 18:51:40'!
anotherBook
	^Product withCode: 321! !

!YourBooksFactory methodsFor: 'creation' stamp: 'NB 6/22/2017 19:13:12'!
fakeMP
	^FakeMerchantProcessor new.! !


!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/25/2017 18:39:57'!
aCartForService: aService
	^ aService createCartForId: 'tango' andPassword: 'fox'! !

!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/25/2017 18:31:18'!
aCartFromService
	self shouldBeImplemented! !

!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/16/2017 20:18:15'!
aCashierWithSalesBook: aSalesBook 
	^Cashier withSalesBook: aSalesBook .
	! !

!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/17/2017 16:12:54'!
aCashierWithSalesBook: aSalesBook forDate: aDate
	^Cashier forDate: aDate withSalesBook: aSalesBook .
	! !

!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/22/2017 19:16:04'!
aCashierWithSalesBook: aSalesBook forDate: aDate andMerchantProcessor: aFakeMerchantProcessor 
	^Cashier forDate: aDate withSalesBook: aSalesBook  andMerchantProcessor: aFakeMerchantProcessor .
	 ! !

!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/22/2017 19:29:15'!
aCashierWithSalesBook: aSalesBook forDate: aDate andMerchantProcessor: aMerchantProcessor andCatalog: aCatalog 
	^Cashier forDate: aDate withSalesBook: aSalesBook  andMerchantProcessor: aMerchantProcessor andCatalog: aCatalog ! !

!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/25/2017 17:16:22'!
anAccountManager
	|accounts|
	accounts := Dictionary new.
	accounts at: 'tango' put: 'fox'. 
	^AccountManager newWithAccounts: accounts! !

!YourBooksFactory methodsFor: 'initialization' stamp: 'NB 6/18/2017 16:58:54'!
pastDate
	^Date year: 2016 month: 12  day: 1! !
