#!/bin/bash

# Xóa thư mục cũ nếu có để làm sạch môi trường
rm -rf my-app

echo "--- Đang tải file zip từ Hugging Face... ---"
# Sử dụng link resolve để tải trực tiếp file thật, tránh lỗi Git LFS
wget https://huggingface.co/datasets/api2/app/resolve/main/my-app.zip -O my-app.zip

echo "--- Đang giải nén... ---"
unzip -o my-app.zip
# Sau khi unzip thường nó sẽ tạo ra thư mục my-app

# Vào thư mục chứa app.js
cd my-app

echo "--- Bắt đầu chạy app.js ---"
# Vòng lặp vô tận đảm bảo app luôn chạy
while true
do
    node app.js
    echo "App bị sập với mã lỗi $?. Đang khởi động lại sau 5 giây..."
    sleep 5
done
