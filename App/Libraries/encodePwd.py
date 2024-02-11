import base64
""" this file is use for encode your password
    encode your keepass password here and use it in command to run robot files
    eg- robot -i Login -v KEEPWD:"your password" -d App\Results App\Testsuite
"""

KEEPWD = "Enter your password here"
encoded_value = base64.b64encode(KEEPWD.encode("ascii")).decode("ascii")

print(encoded_value)
