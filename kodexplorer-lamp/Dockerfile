FROM tutum/lamp:latest
RUN rm -fr /app && git clone https://github.com/kalcaddle/KODExplorer.git /app
EXPOSE 80 3306
CMD ["/run.sh"]
