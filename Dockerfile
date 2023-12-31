FROM ubuntu:23.10

COPY password_manager.sh /usr/local/bin
RUN chmod +x /usr/local/bin/password_manager.sh
VOLUME [ "/data" ]

CMD ["password_manager.sh"]
