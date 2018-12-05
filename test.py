import os

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from pyvirtualdisplay import Display

def main():
    display = Display(visible=0, size=(1024, 768))
    display.start()

    driver = webdriver.Firefox()
    wait = WebDriverWait(driver, 10)
    driver.get('https://google.com')
    driver.find_element_by_name('q').send_keys('selenium')
    driver.find_element_by_name('q').send_keys(Keys.ENTER)
    print(wait.until(EC.presence_of_element_located((By.ID, 'resultStats'))).text)

    driver.close()
    driver.quit()

    display.stop()

if __name__ == '__main__':
    main()
