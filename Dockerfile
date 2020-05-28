FROM alpine
WORKDIR /root
EXPOSE 4000 34444
COPY ./files ./
COPY ./scripts ./scripts
RUN sh scripts/setup.sh
RUN sh scripts/getopticdemo.sh
RUN chmod 755 ./change_posts.sh
RUN chmod 755 ./ignore_requests.sh
ENTRYPOINT api start
