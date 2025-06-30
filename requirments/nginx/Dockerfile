FROM    debian:bookworm

ARG     USERNAME
ARG     PASSWORD

WORKDIR /app

COPY    ./scripts/ .

RUN     apt update && apt upgrade -y
RUN     bash install_script.sh

COPY    ./confs/torrc /etc/tor/torrc
COPY    ./confs/sshd_config /etc/ssh/sshd_config
COPY    ./html/index.html /var/www/html/
COPY    ./confs/nginx.conf /etc/nginx/conf.d

RUN     mkdir /var/lib/tor/my_website/
RUN     chown debian-tor /var/lib/tor/my_website/
RUN     chmod 700 /var/lib/tor/my_website/
RUN     echo "$USERNAME $PASSWORD"
RUN     useradd -m $USERNAME
RUN     echo "$USERNAME:$PASSWORD" | chpasswd
RUN     echo "root:$PASSWORD" | chpasswd
COPY    ./confs/authorized_keys /home/sharnvon/.ssh/
RUN     chown -R sharnvon:sharnvon /home/sharnvon/.ssh

EXPOSE  80
EXPOSE  4242

ENTRYPOINT ["bash", "run_script.sh"]