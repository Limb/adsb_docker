FROM ubuntu:18.04
MAINTAINER Kenneth Lorthioir <kenneth@lorthio.ir>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -O "https://repo-feed.flightradar24.com/linux_x86_64_binaries/fr24feed_1.0.18-5_amd64.tgz" \
 && tar zxvf fr24feed_1.0.18-5_amd64.tgz

CMD ["fr24feed_amd64/fr24feed", "--fr24key", "$FR24_KEY", "--receiver", "beast-tcp", "--logmode", "1", "--logpath", "/var/log", "--mlat", "yes", "--mlat-without-gps", "yes", "--bs", "no", "--raw", "yes" "--host", "$DUMP1090_HOST:$DUMP1090_PORT"]
