const crypto = require('crypto');

const plaintext = 'Hello, World!';
const publicKey = `-----BEGIN PUBLIC KEY-----
                    MIICIjANBgkqhkiG9w0BAQEFAAOCAg8A
                    MIICIjANBgkqhkiG9w0BAQEFAAOCAg8A
                    -----END PUBLIC KEY-----`;

const encrypted = crypto.publicEncrypt(
  {
    key: publicKey,
    padding: crypto.constants.RSA_PKCS1_OAEP_PADDING,
  },
  Buffer.from(plaintext)
);

console.log(encrypted.toString('base64'));
