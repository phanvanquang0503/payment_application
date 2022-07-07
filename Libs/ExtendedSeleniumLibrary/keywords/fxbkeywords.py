from math import ceil, floor
from datetime import datetime
from dateutil.relativedelta import relativedelta
from SeleniumLibrary.base import keyword, LibraryComponent


class FXBKeywords(LibraryComponent):

    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)

    @keyword()
    def get_round_ceiling(self, number, decimals=0):
        """
        Returns rounding mode to round towards positive infinity.

        Firstly, the decimal point in number shifted the correct number of places to the right
        by multiplying number by 10 ** ``decimals``.

        The new value is rounded up to the nearest integer using math.ceil()
        and then the decimal point is shifted back to the left by dividing by 10 ** ``decimals``.

        ``:param number:`` value

        ``:param decimals:`` the number you want to round
        """
        multiplier = 10 ** int(decimals)
        return ceil(number * multiplier) / multiplier

    @keyword()
    def get_round_floor(self, number, decimals=0):
        """
        Returns rounding mode to round towards negative infinity.

        Firstly, the decimal point in number shifted the correct number of places to the right
        by multiplying number by 10 ** ``decimals``.

        The new value is rounded up to the nearest integer using math.floor()
        and then the decimal point is shifted back to the left by dividing by 10 ** ``decimals``.

        ``:param number:`` value

        ``:param decimals:`` the number you want to round

        """
        multiplier = 10 ** int(decimals)
        return floor(number * multiplier) / multiplier

    @keyword()
    def get_date_time_in_the_past_with_specific_year(self, years):
        """
        Gets date time in the past with a specific number of year.

        ``:param years:`` the number of year which you want to subtract
        """
        years_ago = datetime.today() - relativedelta(years=int(years))
        return years_ago.strftime("%d/%m/%Y")
