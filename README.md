# JWTAPL
A WIP library for Dyalog APL to allow for encoding and decoding of JSON Web Tokens.

## How to use

```apl
    token←'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1MTYyMzkwMjIsIm5hbWUiOiJKb2huIERvZSIsInN1YiI6IjEyMzQ1Njc4OTAifQ.2JGObd9SO3x3nxPnJ1XZO-6eRKPBMScb48LJD4KfBDI'
    'your-apl-jwt-secret-goes-here==>' #.JWTAPL.decode token 
    ⍝ Will return a 3 element vector with the namespaces. The last element in the vector will be either the signature, if the secret is correct, or an empty array. 
```

```apl
    h←⎕NS⍬
    h.(alg typ)←'HS256' 'JWT'
    p←⎕NS ''
    p.(name role data)←'John Doe' 'admin' 'Cool Data Goes Here'
    j←'MySecret' #.JWTAPL.encode h p
    ⍝ Returns a character vector of the JWT token.
```


