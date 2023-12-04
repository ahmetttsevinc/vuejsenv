# build stage
FROM node:18 as build-stage
WORKDIR /app
RUN git clone https://github.com/vuejs/v2.vuejs.org.git /app
COPY . .
RUN npm install
RUN npm run build

# production stage
FROM nginx:stable as production-stage
COPY --from=build-stage /app/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]