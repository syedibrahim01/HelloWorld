FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
RUN ls /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
COPY . .
# Install dependencies
RUN npm install

# Install Next.js globally
RUN npm install -g next

# RUN npm run build
# RUN/bin/sh -c npm run build

FROM <base-image>

# Set the working directory
WORKDIR /usr/src/app

# Copy files to the working directory
COPY . /usr/src/app

# Run a shell command
RUN /bin/sh -c npm run build

EXPOSE 3000
USER node
CMD ["npm", "start"]
