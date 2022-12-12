FROM nginx
WORKDIR /usr/local/nginx/htdocs/
ENV PATH=/usr/local/nginx/htdocs:$PATH
COPY . /usr/local/nginx/htdocs/
EXPOSE 8080
CMD ["nginx"]
