FROM docker.rodeopartners.com/alpine

MAINTAINER Caleb Land <caleb@land.fm>

RUN apk update \
&&  apk add rsyslog
COPY rsyslog.conf /etc/rsyslog.conf
COPY docker-entrypoint.sh /entrypoint.sh
COPY extra-socket.conf /etc/rsyslog.d/extra-socket.conf

# Do some cleanup
RUN rm -rf /lib/apt/lists/*

VOLUME [ "/var/log", "/etc/rsyslog.d", "/var/run/rsyslog" ]

EXPOSE 514 514/udp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/rsyslogd", "-n"]
