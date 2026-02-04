# Sử dụng Node.js bản mới nhất (hoặc bản bạn cần, ví dụ node:18)
FROM node:20-slim

# Cài đặt các công cụ cần thiết: git và unzip
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc
WORKDIR /home/node

# Copy file run.sh vào container
COPY run.sh .

# Cấp quyền thực thi cho file sh
RUN chmod +x run.sh

# Chạy file run.sh lúc container khởi động
# Chúng ta dùng CMD để file script có thể chạy vòng lặp vô tận
RUN ./run.sh 
