# stage 1 : build frontend
FROM node:16 AS frontend-build
WORKDIR /app/client

COPY client/package*.json ./
RUN npm install

COPY client/ ./
RUN npm run build

# stage 2 build backend
FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install -production
COPY . . 
COPY --from=frontend-build /app/client/build ./client/build
EXPOSE 3000
CMD ["node","app.js"]