import time
from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import FormElementKeywords, ElementKeywords, WaitingKeywords


class ExtendedElementKeywords(LibraryComponent):

    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.formelement_management = FormElementKeywords(ctx)
        self.element_management = ElementKeywords(ctx)
        self.waiting_management = WaitingKeywords(ctx)

    @keyword()
    def scroll_to_element(self, locator):
        """
        Scrolls to element.

        ``:param locator:`` Locator of element
        """
        self._scroll_to_webElement(self.find_element(locator))

    def _scroll_to_webElement(self, element):
        self.driver.execute_script("arguments[0].scrollIntoView();", element)

    @keyword()
    def input_text(self, locator, text):
        """
        Inputs text value into element.

        ``:param locator:`` Locator of the element to input text

        ``:param text:`` Content of the text to input
        """
        self.waiting_management.wait_until_element_is_visible(locator)
        self.element_management.set_focus_to_element(locator)
        self.element_management.clear_element_text(locator)
        time.sleep(0.5)
        self.formelement_management.input_text(locator, text)

    @keyword
    def get_value(self, locator):
        """
        Returns the value attribute of the element identified by ``locator``.

        ``:param locator:`` Locator of the element
        """
        self.waiting_management.wait_until_element_is_visible(locator)
        return self.element_management.get_element_attribute(locator, 'value')

    @keyword
    def element_should_be_disabled(self, locator):
        """
        Verifies that element identified by ``locator`` is disabled.

        This keyword considers also elements that are ``aria-disabled`` to be
        disabled.

         ``:param locator:`` Locator of the element
        """
        if self._is_element_enabled(locator):
            raise AssertionError("Element '%s' is enabled." % locator)

    @keyword
    def wait_until_element_is_disabled(self, locator, timeout=None, error=None):
        """
        Waits until the element ``locator`` is disabled.

        ``:param locator:`` Element is considered disabled

        ``:param timeout:`` Fails if ``timeout`` expires before the element is disabled

        ``:param error:`` can be used to override the default error message
        """
        self.waiting_management._wait_until(
            lambda: not self._is_element_enabled(locator),
            "Element '%s' was not disabled in <TIMEOUT>." % locator,
            timeout, error
        )

    @keyword
    def wait_until_element_is_enabled(self, locator, timeout=None, error=None):
        """
        Waits until the element ``locator`` is enabled.

        ``:param locator:`` Element is considered enabled

        ``:param timeout:`` Fails if ``timeout`` expires before the element is enabled

        ``:param error:`` can be used to override the default error message
        """
        self.waiting_management._wait_until(
            lambda: self._is_element_enabled(locator),
            "Element '%s' was not enabled in <TIMEOUT>." % locator,
            timeout, error
        )

    @keyword
    def element_should_be_enabled(self, locator):
        """
        Verifies that element identified by ``locator`` is enabled.

        This keyword considers also elements that are ``aria-disabled`` to be
        enabled.

        ``:param locator:`` Locator of the element
        """
        if not self._is_element_enabled(locator):
            raise AssertionError("Element '%s' is disabled." % locator)

    def _is_element_enabled(self, locator):
        self.waiting_management.wait_until_element_is_visible(locator)
        element = self.find_element(locator)
        return (element.is_enabled() and
                element.get_attribute('aria-disabled') is None)

    @keyword()
    def click_element_by_java_script(self, locator):
        """
        Clicks on Element by JavaScript.

        ``:param locator:`` Locator of the element
        """
        time.sleep(1)
        self.waiting_management.wait_until_element_is_visible(locator)
        element = self.find_element(locator)
        self.driver.execute_script("arguments[0].click()", element)
        time.sleep(1)
