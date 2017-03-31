FROM zuolan/glusterfs

ENV GLUSTER_VOL_NAME vol
ENV GLUSTER_REPLICA 2
ENV GLUSTER_BRICK_PATH /volume
ENV GLUSTER_PEER **ChangeMe**
ENV SERVER_IP **ChangeMe**
ENV DEBUG 0

COPY server/run.sh /run.sh
COPY server/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /run.sh
VOLUME ["$GLUSTER_BRICK_PATH"]

CMD ["/run.sh"]
