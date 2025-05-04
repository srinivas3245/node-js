FROM node:18 As builder

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev
COPY . .

#--------stage2:runtime------
FROM node:18-slim
WORKDIR /app

COPY --from=builder /app /app
EXPOSE 3000
CMD ["node","index.js"]
