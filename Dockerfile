FROM ubuntu:23.10

WORKDIR /PasswordManager

COPY password_manager.sh /usr/local/bin
RUN chmod +x /usr/local/bin/password_manager.sh

CMD ["password_manager.sh"]
