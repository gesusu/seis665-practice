FROM nginx
RUN apt-get update -y
LABEL maintaner="George Bichage"
LABEL email="bich3561@stthomas.edu"
LABEL version="1.0"
EXPOSE 80/tcp
COPY index.html /usr/share/nginx/html 
