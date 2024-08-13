FROM node:16-alpine
WORKDIR /app

COPY src /app/src
COPY bin /app/bin
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "/dist/bundle.js"]
