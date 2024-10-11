# JWTAPL Library

JWTAPL is a robust APL library designed for encoding and decoding JSON Web Tokens (JWT). It simplifies the process of handling JWTs within your APL projects, providing straightforward functions to securely manage token creation and verification.

## Features

- **Encode JWTs:** Create JWTs with customizable headers and payloads.
- **Decode JWTs:** Verify and extract information from JWTs using your secret key.
- **Handle Unencrypted Tokens:** Supports encoding without an algorithm, resulting in unencrypted tokens.
- **Easy Integration:** Seamlessly integrates into APL projects with simple installation and usage commands.
- **Comprehensive Testing:** Includes a suite of tests using the Tester2 framework to ensure reliability.

## Installation

To install the JWTAPL library, use the `tatin` package manager. Execute the following command in your APL environment:

```apl
]tatin.installpackages JWTAPL
```

## Usage

After installation, you can access the primary functions of JWTAPL: `Encode` and `Decode`.

### Encoding a JWT

To encode a JWT, define your header and payload as namespaces and use the `Encode` function with your secret key.

```apl
⎕NS h ← ''
h.(alg typ) ← 'HS256' 'JWT'

⎕NS p ← ''
p.(name group) ← 'John Doe' 'admin'

secret ← 'mysecret'

token ← secret JWTAPL.Encode h p
```

#### Result of `Encode`

- **Type:** `Character Vector`
- **Description:** The `Encode` function returns a JWT as a compact, URL-safe string. This string consists of three base64url-encoded segments separated by dots (`.`): the header, the payload, and the signature.
- **Example:**

  ```
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSm9obiBEb2UiLCJncm91cCI6ImFkbWluIn0.b2N2n-dOBBsuQVUSrxuLfGicWwTzw4FmdDu9pwUjJZk'
  ```

- **Unencrypted Tokens:**

  If you set the algorithm as 'none' in the header, `Encode` will generate an unencrypted token. Unencrypted tokens consist only of the header and payload without a signature.

  ```apl
  ⎕NS h ← ''
  h.(alg typ) ← 'none' 'JWT'  ⍝ 'none' algorithm provided

  ⎕NS p ← ''
  p.(name group) ← 'John Doe' 'admin'

  token ← '' JWTAPL.Encode h p ⍝ The secret provided to the function is not used in this case. 
  ```

  **Resulting Token:**

  ```
  'eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJncm91cCI6ImFkbWluIiwibmFtZSI6IkpvaG4gRG9lIn0'
  ```

### Decoding a JWT

To decode and verify a JWT, use the `Decode` function with the secret key and the token.

```apl
secret ← 'your-apl-jwt-secret-goes-here'
token ← 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSm9obiBEb2UiLCJncm91cCI6ImFkbWluIn0.2JGObd9SO3x3nxPnJ1XZO-6eRKPBMScb48LJD4KfBDI'

result ← secret JWTAPL.Decode token
```

#### Result of `Decode`

- **Type:** `Vector` containing `(Header Namespace, Payload Namespace, Is Valid Signature)`
- **Description:** The `Decode` function returns a vector consisting of the header namespace, payload namespace, and a validity flag indicating whether the signature is valid.
  
  - **Header Namespace:** Contains metadata about the token, such as the signing algorithm (`alg`) and token type (`typ`).
  - **Payload Namespace:** Contains the claims or data embedded within the token, such as `name`, `group`, etc.
  - **Is Valid Signature:** An indicator (`1` or `0`) showing whether the token's signature is valid (`1`) or invalid (`0`). Note that this may also indicate that the algorithm used was not supported or valid. 

- **Example Usage:**

  ```apl
  h p isValid← result
  ```

- **Handling Unencrypted Tokens:**

  If an unencrypted token (lacking a signature) is passed to `Decode`, the `IsValidSignature` flag will be `0`, indicating that the token's integrity could not be verified.

  ```apl
  secret ← ''
  token ← 'eyJhbGciOiIiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiSmFuZSBEb2UiLCJncm91cCI6InVzZXIifQ'

  result ← secret JWTAPL.Decode token
  ```

  **Result:**

  ```apl
  h p isValid←result ⍝ isValid=0 
  ```

## Testing

JWTAPL includes a comprehensive set of test cases using the Tester2 framework by aplteam. These tests ensure the reliability and correctness of the encoding and decoding processes.

### Running Tests

To execute the test suite, use the following command in your APL environment:

```apl
TestCases.RunTests
```

The tests cover scenarios such as:

- Decoding tokens with valid and invalid signatures.
- Handling unsigned tokens.
- Encoding tokens with and without signatures.

**Note:** The test cases utilize the Tester2 framework, and the instance is referred to as `T` within the tests.

### Test Cases Overview

The test suite includes the following cases:

1. **Test Decode of a Token with a Signature:**
   - Verifies decoding a valid token with a correct signature.
   
2. **Test Decode with Incorrect Signature:**
   - Ensures that tokens with invalid signatures are correctly identified as invalid.
   
3. **Test Decode with an Unsigned Token:**
   - Checks that unsigned tokens are marked with an invalid signature flag.
   
4. **Test Encode Token:**
   - Validates that encoding with a secret and algorithm produces the expected token.
   
5. **Test Encode Unsigned Token:**
   - Confirms that encoding without a secret or algorithm generates an unencrypted token.

These tests utilize deliberate errors and preconditions to simulate different scenarios and validate the library's behavior.

## Development

To open and work on the JWTAPL project, use the `cider` tool with the following command:

```apl
]cider.openproject .
```

This command will open the project in your development environment, allowing you to explore and modify the library as needed.

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute this library in your own projects.

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests to enhance the functionality and performance of JWTAPL.

## Contact

For any questions or support, please reach out to [Holden Hoover](mailto:holdenhoover@bkaw.ca) or submit an issue on the project's repository.

---

**JWTAPL** aims to provide a seamless experience for managing JWTs in APL, ensuring security and efficiency in your token-based authentication processes.