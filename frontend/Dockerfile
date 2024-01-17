FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM gcr.io/distroless/nodejs20-debian11
WORKDIR /app
COPY --from=build /app .
CMD ["app.js"]
