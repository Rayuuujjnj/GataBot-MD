FROM node:20.10.0-alpine3.18

#La distribucion alpine3 es mas optima para contenedores
#se agrega GIT porque alpine3 no lo trae por defecto
RUN apk update && \
  apk add --no-cache \
  git \
  ffmpeg \
  imagemagick \
  libwebp-tools && \
  rm -rf /var/cache/apk/*

COPY package*.json .

RUN npm install

COPY . .

EXPOSE 5000

# Iniciará con el QR
CMD ["npm", "run", "qr"]
