# Belgian VAT number generator

Belgian VAT numbers use checksum digits to ascertain their validity. This project aims to create a webpage where random numbers with correct checksum digits are generated to be used elsewhere.

## Belgian VAT number specification

A Belgian VAT number consists of 10 digits. The first 8 digits form the base number, which always starts with 0 or 1. The last 2 digits are the checksum digits.

The checksum digits are obtained as follows:

- Perform an integer division with the base number as dividend and divisor 97
- Multiply the resulting quotient by 97
- Subtract this product from the base number
- The checksum digits are the result from subtracting that difference from 97

More concise: `checksum = 97 - (base - ((base div 97) * 97))`