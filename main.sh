#!/bin/bash

# تابع برای تولید یک آدرس تصادفی در یک رنج مشخص
generate_random_ip() {
    local ip_range=$1
    IFS='/' read -r ip mask <<< "$ip_range"
    IFS='.' read -r i1 i2 i3 i4 <<< "$ip"
    
    # محاسبه تعداد آدرس‌های IP در این رنج
    local num_ips=$((2**(32-mask)))
    
    # انتخاب یک آدرس IP تصادفی
    local rand_ip=$((RANDOM % num_ips))
    
    # تبدیل عدد تصادفی به آدرس IP
    local rand_i4=$(( (rand_ip & 255) + i4 ))
    local rand_i3=$(( ((rand_ip >> 8) & 255) + i3 ))
    local rand_i2=$(( ((rand_ip >> 16) & 255) + i2 ))
    local rand_i1=$(( ((rand_ip >> 24) & 255) + i1 ))
    
    echo "$rand_i1.$rand_i2.$rand_i3.$rand_i4"
}

# تابع برای گرفتن اطلاعات جغرافیایی یک IP
get_country() {
    local ip=$1
    local country=$(curl -s "https://ipinfo.io/${ip}/json" | grep -o '"country": "[^"]*' | grep -o '[^"]*$')
    echo "${country:-Unknown}"
}

# لیست رنج‌های IP
ip_ranges=(
    "15.230.80.0/24"
    "15.230.241.0/24"
    "15.230.144.0/24"
    "17.1.172.76/31"
    "17.1.172.196/31"
    "17.30.0.0/25"
    "17.30.12.0/23"
    "17.66.64.0/21"
    "17.66.72.0/22"
    "17.66.88.0/24"
    "17.66.90.0/25"
    "17.66.90.128/27"
    "17.66.90.160/28"
    "17.66.90.176/29"
)

# تولید و چاپ تنها آدرس IP تصادفی
for ip_range in "${ip_ranges[@]}"; do
    random_ip=$(generate_random_ip "$ip_range")
    country=$(get_country "$random_ip")
    echo "$random_ip (Country: $country)"
done
