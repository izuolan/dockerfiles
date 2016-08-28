FROM tutum/lamp:latest
MAINTAINER izuolan <i@zuolan.me>
RUN apt update -y && apt install -y php5-gd
WORKDIR /app
RUN rm -fr /app && git clone https://github.com/kalcaddle/KODExplorer.git /app
RUN chmod -R 777 /app
EXPOSE 80 3306
CMD ["/run.sh"]
