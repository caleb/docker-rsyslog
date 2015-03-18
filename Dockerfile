FROM debian:jessie

MAINTAINER Caleb Land <caleb@land.fm>

RUN apt-get update \
&&  apt-get install -y rsyslog
COPY rsyslog.conf /etc/rsyslog.conf
COPY docker-entrypoint.sh /entrypoint.sh
COPY extra-socket.conf /etc/rsyslog.d/extra-socket.conf

VOLUME [ "/var/log", "/etc/rsyslog.d", "/var/run/rsyslog" ]

EXPOSE 514 514/udp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/rsyslogd", "-n"]
