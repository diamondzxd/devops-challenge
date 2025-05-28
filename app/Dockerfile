FROM node:24-slim

# Create and use a non-root user
RUN useradd -m appuser

WORKDIR /home/appuser/app

COPY package.json server.js ./

RUN npm install

# chown the app directory to appuser
RUN chown -R appuser:appuser /home/appuser

USER appuser

EXPOSE 8080

CMD ["npm", "start"]