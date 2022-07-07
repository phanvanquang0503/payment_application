from SeleniumLibrary.base import keyword, LibraryComponent
from .elementkeywords import ExtendedElementKeywords


class TableKeywords(LibraryComponent):

    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.elementkeywords_management = ExtendedElementKeywords(ctx)

    @keyword
    def get_cell_value_in_table(self, locator, col_index, row_index):
        """
        Gets table's cell.

        ``:param locator:`` locator of table

        ``:param col_index:`` column name of cell

        ``:param row_index:`` row index of cell

        ``:return:`` cell element
        """
        row = self._get_row_by_index(locator, row_index)
        cols = self._get_table_columns_by_row(row)
        return self._get_element_text(cols[col_index])

    def _get_row_by_index(self, locator, row_index):
        """
        Gets a row from table by using the index of the row.

        ``:param locator:`` locator of the table

        ``:param row_index:`` index of row

        ``:return:`` the row based on the given index
        """
        rows = self._get_table_rows(locator)
        try:
            return rows[int(row_index)]
        except:
            message = "Index '%s' is out of range." % row_index
            raise AssertionError(message)

    def _get_element_text(self, element):
        """
        Gets value of element with corresponding tag name.

        ``:param element:`` cell element

        ``:return:`` value of element
        """
        if self._is_element_contain_tag(element, "input"):
            return element.find_element_by_tag_name("input")[0].get_attribute("value")
        if self._is_element_contain_tag(element, "select"):
            return element.find_element_by_tag_name("select")[0].get_attribute("title")
        return element.get_attribute("textContent")

    def _is_element_contain_tag(self, element, tag):
        return len(element.find_elements_by_tag_name(tag)) > 0

    def _get_table_rows(self, locator):
        """
        Gets all rows in the table.

        ``:param locator:`` table locator

        ``:return:`` all rows in table
        """
        rows = self.find_element(locator).find_elements_by_tag_name("tr")
        return rows

    def _get_table_columns_by_row(self, element):
        """
        Gets all the columns on row.

        ``:param element:`` row element

        ``:return:`` columns of row
        """
        tds = element.find_elements_by_tag_name("td")
        return tds

    @keyword
    def get_table_row_count(self, locator):
        """
        Gets the number of the row in the table

        ``:param locator:`` table's locator

        ``:return:`` number of row
        """
        try:
            rows = self._get_table_rows(locator)
            return len(rows)
        except:
            return 0

    @keyword
    def get_column_index_by_title(self, locator, column_name, times_appear=1):
        """
        Gets index of the column in table by column's name

        ``:param locator:`` locator of the table

        ``:param column_name:`` column's name in the table

        ``:param times_appear:`` times appear of the column_name in the table

        ``:return:`` index of column
        """
        time_app = 1
        headers = self._get_table_headers(locator)
        for i in range(0, len(headers)):
            if not headers[i].is_displayed():
                self.elementkeywords_management.scroll_to_element(headers[i])
            if self._simplify_string(headers[i].text.replace('\n', '')) == self._simplify_string(column_name):
                if time_app == int(times_appear):
                    return i
                time_app += 1
        message = "Not found the '%s' column in table '%s'" % (column_name, locator)
        raise AssertionError(message)

    def _simplify_string(self, string):
        return string.lower().replace(' ', '').strip()

    def _get_table_headers(self, locator):
        headers = self.find_element(locator).find_elements_by_tag_name("td")
        return [header for header in headers]

    @keyword
    def get_row_index_by_column_title(self, table_locator, column_title, cell_value, header_table_locator=None):
        """
        Gets index of the row in the table by column title.

        ``:param table_locator:`` locator of table

        ``:param column_title:`` name of column

        ``:param cell_value:`` value of cell

        ``:param header_table_locator:`` locator of table header

        ``:return:`` index of the row in the table
        """
        if header_table_locator is None:
            header_locator = table_locator
        else:
            header_locator = header_table_locator
        column_index = self.get_column_index_by_title(header_locator, column_title)
        _col_data = self.get_all_data_on_column_by_index(table_locator, column_index)
        for i in range(0, len(_col_data)):
            if self._simplify_string(_col_data[i]) == self._simplify_string(cell_value):
                return i
        message = "Cell %s under column %s NOT FOUND in table %s." % (cell_value, column_title, table_locator)
        raise AssertionError(message)

    @keyword
    def get_all_data_on_column_by_index(self, locator, column_index):
        """
        Gets all cell values under a column by column's index.

        ``:param locator:`` locator of the table

        ``:param column_index:`` index of the column

        ``:return:`` array of cell values
        """
        rows = self._get_table_rows(locator)
        colValues = []
        for row in rows:
            if not row.is_displayed():
                self.elementkeywords_management.scroll_to_element(row)
            cols = self._get_table_columns_by_row(row)
            if not cols[column_index].is_displayed():
                self.elementkeywords_management.scroll_to_element(cols[column_index])
            colValues.append(self._get_element_text(cols[column_index]))
        return colValues
