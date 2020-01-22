import 'package:rsa_test/fileReader.dart' as reader;
import 'package:rsa_test/messageEncrypter.dart';

// demonstration of how to use this
int main(List<String> arguments) {
  final password1 = 'password';
  final password2 = '123456';
  final message = 'Hello, world!';

  // sender creates a MessageEncrypter upon sending the very first message
  var sender = MessageEncrypter(password1);

  // recipient creates a MessageEncrypter upon receiving the very first message
  // the text key will have to be sent in plaintext for the very first go, but not stored
  var recipient = MessageEncrypter.forReceiver(
    password2, sender.textKey, sender.ivText
  );

  // sender and receiver can encrypt and decrypt just fine
  var cipher = sender.encrypt(message);
  var plaintext = recipient.decrypt(cipher);
  assert(message == plaintext);

  // users can store their key, encrypted, and retrieve it at any time
  // call any time after they've generated their first MessageEncrypter and stored it
  // be sure to store the result of encodeData
  reader.sendData(sender.encodeData());
  var data = reader.loadData();
  var rehydrated = MessageEncrypter.rehydrate(password1, data);

  plaintext = rehydrated.decrypt(cipher);
  assert(message == plaintext);

  return 0;
}
