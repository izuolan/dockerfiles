FROM tutum/lamp:latest
MAINTAINER izuolan <i@zuolan.me>
RUN apt update && apt install php5-gd
RUN rm -fr /app && git clone https://github.com/kalcaddle/KODExplorer.git /app
EXPOSE 80 3306
CMD ["/run.sh"]
