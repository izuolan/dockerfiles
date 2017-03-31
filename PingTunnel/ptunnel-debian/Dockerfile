FROM debian:jessie
RUN apt-get update && \
    apt-get install openssh-server ptunnel -y && \
    apt-get clean
RUN echo "#! /bin/bash\n\
service ssh start \n\
ptunnel -p \$IP -lp \$MIDDLE_PORT -da 127.0.0.1 -dp \$SSH_PORT" >> /run.sh && \
    chmod a+x /run.sh && \
    cat /run.sh
ENV IP=127.0.0.1 MIDDLE_PORT=8000 SSH_PORT=22
# EXPOSE 22 8000
# ENTRYPOINT
CMD ["/run.sh"]
