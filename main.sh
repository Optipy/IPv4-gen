import random

# تابع برای تولید یک آدرس IPv4 تصادفی
def generate_ipv4():
    return ".".join(str(random.randint(0, 255)) for _ in range(4))

# تابع برای تولید آدرس IPv4 بر اساس کشور
def generate_ipv4_for_country(country_name):
    # در اینجا، تولید آدرس تصادفی برای هر کشور
    # در واقع باید از دیتابیس IP بر اساس نام کشور استفاده کنید
    return generate_ipv4()

# تولید آدرس IPv4 برای یک کشور خاص
country_name = "United States"  # مثال: ایالات متحده
ipv4_address = generate_ipv4_for_country(country_name)
print(f"Generated IPv4 Address for {country_name}: {ipv4_address}")

# تبدیل به اسکریپت Bash
bash_script = f"""#!/bin/bash

# Generated IPv4 Address for {country_name}
ip_address={ipv4_address}
echo "IP Address for {country_name}: $ip_address"
"""

# ذخیره کردن اسکریپت Bash به فایل
with open("generate_ip.sh", "w") as file:
    file.write(bash_script)

print("Bash script generated: generate_ip.sh")
