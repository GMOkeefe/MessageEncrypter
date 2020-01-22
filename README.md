<h2>Message Encrypter</h2>

The only necessary class is MessageEncrypter. All others are for the purposes of testing it.

There is comment-based documentation for its use.

It has 2 dependencies, the ```password``` and ```encrypt``` dart libraries.

<h3>Message Encrypter Class Methods</h3>

<h4>Constructors</h4>

```MessageEncrypter(String password):```

​	Simply pass a password, in plaintext or encrypted, so long as you are consistent, into the constructor. This will generate a key from the password and randomly generate a key for encrypting text.

```MessageEncrypter.forReceiver(String password, String keyData, String ivData):```

​	This is a bit more complex. When creating the encrypter for the recipient, you need the same data that the sender just generated randomly. So you need to pass in the recipient's password, as well as the ```textKey``` and the ```ivText``` that the sender's getter functions return. Do not store the ```textKey```.

```MessageEncrypter.rehydrate(String password, String retrievedData):```

​	This one takes in the password of the user creating it, as well as the output of ```encodeData()```.  This is for all encryption/decryption purposes after the very first time you create a ```MessageEncrypter```.

<h4>Methods</h4>

```String encrypt(String text):```

​	Simply enter some plaintext, and it will return the text encrypted.

```String decrypt(String cipher):```

​	Simply enter some ciphertext, and it will decrypt it.

```String encodeData()```

​	Encrypts the key and allows you to store it however you want to store it.