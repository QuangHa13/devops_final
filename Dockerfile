# Sử dụng Node.js làm môi trường
FROM node:16

# Tạo thư mục ứng dụng
WORKDIR /usr/src/app

# Copy package.json và cài đặt dependencies
COPY package*.json ./
RUN npm install

# Copy mã nguồn vào container
COPY . .

# Mở port và chạy ứng dụng
EXPOSE 8080
CMD ["npm", "start"]
