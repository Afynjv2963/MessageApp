FROM node:20-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

COPY wait-for-db.sh .
RUN chmod +x wait-for-db.sh

RUN npx prisma generate

RUN npm run build

EXPOSE 3001

CMD ["./wait-for-db.sh", "node", "dist/main.js"]