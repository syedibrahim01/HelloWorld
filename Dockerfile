FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
RUN ls l
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
COPY . .
RUN npm install
RUN npm run build
EXPOSE 3000
USER node
CMD ["npm", "start"]
