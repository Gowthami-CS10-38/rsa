import 'package:pointycastle/export.dart';
import 'dart:convert';

void main() {
  var plaintext = 'Hello, World!';
  var rsaPublicKey = RSAKeyParser().parse('''-----BEGIN PUBLIC KEY-----
                                            MIICIjANBgkqhkiG9w0BAQEFAAOCAg8A
                                            MIICIjANBgkqhkiG9w0BAQEFAAOCAg8A
                                            -----END PUBLIC KEY-----''');

  var encrypter = AsymmetricBlockCipher('RSA');
  encrypter.init(true, PublicKeyParameter<RSAPublicKey>(rsaPublicKey));
  var encryptedBytes = encrypter.process(utf8.encode(plaintext));

  var encrypted = base64Encode(encryptedBytes);
  print(encrypted);
}
