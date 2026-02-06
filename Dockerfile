#stage 1 : build frontend
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
















 # ---------- Stage 1: Build Frontend ----------
# FROM node:18 AS frontend-build
# WORKDIR /app/client

# ENV NODE_OPTIONS=--openssl-legacy-provider

# RUN npm config set fetch-retries 5 \
#  && npm config set fetch-retry-mintimeout 20000 \
#  && npm config set fetch-retry-maxtimeout 120000

# COPY client/package*.json ./
# RUN npm ci

# COPY client/ .
# RUN npm run build


 # ---------- Stage 2: Build Backend ----------
# FROM node:18-alpine
# WORKDIR /app

# ENV NODE_ENV=production

# RUN npm config set fetch-retries 5 \
#  && npm config set fetch-retry-mintimeout 20000 \
#  && npm config set fetch-retry-maxtimeout 120000

# COPY package*.json ./
# RUN npm ci --omit=dev

# COPY . .
# COPY --from=frontend-build /app/client/build ./client/build

# EXPOSE 3000
# CMD ["node", "app.js"]
