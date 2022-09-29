FROM jekyll/jekyll:stable AS build
WORKDIR /app
COPY . .
ENV TZ=Europe/London
RUN mkdir -p .jekyll-cache _site \
    && jekyll build --trace

FROM nginx
COPY --from=build /app/_site /usr/share/nginx/html
EXPOSE 80

