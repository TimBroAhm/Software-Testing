from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Setup the WebDriver (assuming Chrome in this case)
driver = webdriver.Chrome()

# Open the login page
driver.get("http://192.168.10.20:8081/help/loginn.php")

# Locate and interact with the username field (adjust class or XPath based on your observation)
username_field = driver.find_element(By.CLASS_NAME, "navbar-nav")  # Use the correct class name here
username_field.send_keys("your_username")

# Locate and interact with the password field
password_field = driver.find_element(By.NAME, "password")  # Assuming the password field has name="password"
password_field.send_keys("your_password")

# Locate and click the login button
login_button = driver.find_element(By.XPATH, "//button[@type='submit']")  # Adjust based on actual button element
login_button.click()

# Optionally, take a screenshot after login attempt (success or failure)
driver.save_screenshot("screenshot.png")

# Validate login
try:
    welcome_message = driver.find_element(By.XPATH, "//div[@class='welcome-message']")
    print("Login successful!")
except Exception as e:
    print("Login failed:", e)

# Close the browser
driver.quit()
