## PasserOne

Passes data to `PasserTwo` via their App Group's Shared Keychain items.

### Pros
* Easy to implement.
* OS can guarantee that data isn't tampered with during transfer.

### Cons
* Data may be saved in cleartext. In any case, the data should be encrypted using asymmetric encryption algorithm.


## PasserTwo

Passes data to `PasserOne` via a custom URL scheme, as described in Apple's [Inter-App Communication Guide](https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Inter-AppCommunication/Inter-AppCommunication.html).

### Pros
* Easy to implement

### Cons
* Only text can be passed.
* The receiving app must be launched in order for it to receive the data.
* Any app could send data to the receiving app, the receiving app needs to carry out further checks to ensure the data is coming from the indended sender.

