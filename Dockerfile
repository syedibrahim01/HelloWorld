FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
RUN ls /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
COPY . .
RUN npm install
RUN npm install -g npm@9.8.0` to update!
RUN npm update
RUN npm run build
EXPOSE 3000
USER node
CMD ["npm", "start"]
