import 'package:rsa_test/messageEncrypter.dart';
import 'package:test/test.dart';

void main() {
  test('Creating a recipient', () {
    final password1 = 'password';
    final password2 = '12345678';

    var sender = MessageEncrypter(password1);
    var recipient = MessageEncrypter.forReceiver(
      password2, sender.textKey, sender.ivText
    );

    expect(sender.textKey, recipient.textKey);
    expect(sender.ivText, recipient.ivText);
    expect(sender.passKey != recipient.passKey, true);
  });

  test('Encrypting a message', () {
    final password = 'password';
    final message = 'message';
    
    var encrypter = MessageEncrypter(password);
    var cipher = encrypter.encrypt(message);
    expect(encrypter.decrypt(cipher), message);
  });
}
