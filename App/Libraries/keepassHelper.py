from pykeepass import PyKeePass
from robot.libraries.BuiltIn import BuiltIn
import os
import base64
from pykeepass.exceptions import *

class keepassHelper():
    def get_credentials_from_keepass(self, KEEPWD, title):
        keeFilePath = os.path.join(BuiltIn().get_variable_value("${TESTDATA_DIR}"), "db.kdbx")
        new_pwd = base64.b64decode(KEEPWD.encode("ascii")).decode("ascii")
        try:
            kp = PyKeePass(keeFilePath, password=new_pwd)
            entries = kp.find_entries(title=title, first=True)
            return {
                'username': entries.username,
                'password': entries.password
            }
        except CredentialsError:
            raise Exception('Keepass credentials are invalid. please update valid password and try again.')
        except HeaderChecksumError:
            raise  Exception('seems like keepass database is currupted.')
        except PayloadChecksumError:
            raise Exception('seems like keepass database got currpted while saving.')
