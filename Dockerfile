FROM node:18-alpine AS build
WORKDIR /app
COPY index.html .

# "Mínimo Privilegio"

FROM nginx:alpine

COPY --from=build /app/index.html /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]