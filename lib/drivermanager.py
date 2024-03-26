from selenium import webdriver
from selenium.webdriver.edge.service import Service as EdgeService
from webdriver_manager.microsoft import EdgeChromiumDriverManager


def install_edgedriver():
    driver = webdriver.Edge(service=EdgeService(EdgeChromiumDriverManager().install()))
    return driver
