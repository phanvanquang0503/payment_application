from SeleniumLibrary import SeleniumLibrary
from .keywords import TableKeywords, ExtendedElementKeywords, FXBKeywords

__version__ = '1.0.0'


class ExtendedSeleniumLibrary(SeleniumLibrary):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        SeleniumLibrary.__init__(self, 60, run_on_failure='Capture Screenshot On Failure')
        self.add_library_components([TableKeywords(self), ExtendedElementKeywords(self), FXBKeywords(self)])
