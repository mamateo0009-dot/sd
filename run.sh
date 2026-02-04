#!/bin/bash

# Thư mục làm việc chính
WORKDIR="/app-container"

if [ "$1" == "setup" ]; then
    echo "--- Đang cài đặt dự án ---"
    # 1. Git clone
    git clone https://huggingface.co/datasets/api2/app $WORKDIR
    
    # 2. Vào thư mục và giải nén
    cd $WORKDIR
    unzip "my*" # Giải nén file có tên bắt đầu bằng 'my'
    
    echo "--- Setup hoàn tất ---"

elif [ "$1" == "start" ]; then
    echo "--- Đang khởi chạy ứng dụng (Forever Mode) ---"
    # Di chuyển vào thư mục chứa app.js (dựa trên yêu cầu của bạn là cd vào my-app)
    cd $WORKDIR/my-app
    
    # Vòng lặp vô tận để đảm bảo app.js không bao giờ tắt
    while true
    do
        echo "Khởi động app.js lúc $(date)"
        node app.js
        echo "App bị sập! Đang tự động khởi động lại sau 3 giây..."
        sleep 3
    done
else
    echo "Sử dụng: ./run.sh [setup|start]"
fi
