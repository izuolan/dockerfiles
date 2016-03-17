FROM tutum/lamp
MAINTAINER izuolan <i@zuolan.me>

RUN rm -fr /app && git clone https://github.com/typecho/typecho.git /app
# RUN git clone https://github.com/kalcaddle/KODExplorer.git /app/setting
EXPOSE 80 3306
CMD ["/run.sh"]
