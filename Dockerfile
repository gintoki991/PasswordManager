FROM ubuntu:23.10

COPY PasswordManager /usr/local/bin
RUN chmod +x /usr/local/bin/PasswordManager

CMD ["PasswordManager"]
