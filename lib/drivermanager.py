from selenium import webdriver


def install_driver(browser):
    if browser == "edge":
        driver = webdriver.Edge()
        return driver
    elif browser == "chrome":
        driver = webdriver.Chrome()
        return driver
    else:
        raise Exception("Invalid browser type!")
