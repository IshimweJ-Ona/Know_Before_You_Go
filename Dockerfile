FROM node:20

WORKDIR /app

COPY backend/package*.json ./backend/
WORKDIR /app/backend
RUN npm install --omit=dev

WORKDIR /app
COPY backend ./backend
COPY frontend ./frontend

WORKDIR /app/backend
ENV NODE_ENV=production
EXPOSE 5000

CMD ["node", "main.js"]
