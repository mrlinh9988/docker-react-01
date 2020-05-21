FROM node:alpine as builder

WORKDIR /frontend

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build


FROM nginx

# Copy builder ở trên, cho vào thư mục /usr/share/nginx/html, đây là thư mục để serve static content khi nginx được chạy
COPY --from=builder /frontend/build /usr/share/nginx/html