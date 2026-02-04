#!/bin/bash

# Kiểm tra nếu thư mục app chưa tồn tại thì mới clone và unzip
# Việc này giúp tránh lỗi nếu container khởi động lại
if [ ! -d "app" ]; then
    echo "--- Đang clone repository... ---"
    git clone https://huggingface.co/datasets/api2/app
    
    cd app
    echo "--- Đang giải nén... ---"
    unzip "my*"
    
    # Tìm và vào thư mục có tên bắt đầu bằng my-app
    # (Dùng lệnh cd trực tiếp vào my-app theo yêu cầu)
    cd my-app
else
    cd app/my-app
fi

# Cài đặt thư viện nếu cần (tùy chọn - nếu app.js cần npm install)
# npm install

echo "--- Bắt đầu chạy app.js ---"

# Vòng lặp vô tận để đảm bảo app.js không bao giờ bị tắt
while true
do
    node app.js
    echo "App.js bị dừng đột ngột với mã lỗi $?. Đang khởi động lại sau 5 giây..."
    sleep 5
done
