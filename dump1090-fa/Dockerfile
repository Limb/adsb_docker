FROM ubuntu:18.04 as builder
RUN apt-get update \
 && apt-get install -y git dpkg-dev libbladerf-dev debhelper librtlsdr-dev \
 libusb-1.0-0-dev pkg-config dh-systemd libncurses5-dev
RUN cd /tmp/ \ 
 && git clone https://github.com/flightaware/dump1090.git \
 && cd dump1090 \
 && dpkg-buildpackage -b

FROM ubuntu:18.04
MAINTAINER Kenneth Lorthioir <kenneth@lorthio.ir>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends libbladerf1 librtlsdr0 lighttpd ca-certificates \
 libterm-readline-perl-perl

COPY --from=builder /tmp/dump1090-fa*.deb /tmp/
COPY start.sh /start.sh
RUN dpkg -i /tmp/dump1090-fa*.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && mkdir -p /run/dump1090-fa \
 && chmod +x /start.sh

CMD ["/start.sh"]
