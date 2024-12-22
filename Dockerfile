FROM ubuntu:latest

ENV TERM=xterm

RUN apt-get update && apt-get install -y \
    libaa-bin \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

CMD ["aafire"] 