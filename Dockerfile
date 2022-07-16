FROM node:16-alpine
WORKDIR /app
EXPOSE 3000
COPY . .
ENTRYPOINT ["npm", "run", "dev", "--", "--host"]