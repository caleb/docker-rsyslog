FROM debian:jessie

MAINTAINER Caleb Land <caleb@land.fm>

RUN apt-get update \
&&  apt-get install -y rsyslog
COPY rsyslog.conf /etc/rsyslog.conf
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME [ "/var/log", "/etc/rsyslog.d", "/var/run/rsyslog" ]

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/rsyslogd", "-n"]
