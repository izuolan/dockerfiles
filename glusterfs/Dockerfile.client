FROM zuolan/glusterfs

ENV GLUSTER_VOL_NAME vol
ENV GLUSTER_VOL_PATH /volume
ENV GLUSTER_PEER **ChangeMe**
ENV DEBUG 0

COPY client/run.sh /run.sh
COPY client/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /run.sh
WORKDIR ${GLUSTER_VOL_PATH}
VOLUME ["${GLUSTER_VOL_PATH}"]

CMD ["/run.sh"]
