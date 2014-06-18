FROM phusion/baseimage

RUN apt-get update -y
RUN apt-get install -y php5-fpm php5-mysql
# Listen on port 9000 any address
RUN sed -i '/^listen/c \
listen = 9000' /etc/php5/fpm/pool.d/www.conf
# Disable dynamic pools for now
RUN sed -i '/^pm =/c \
pm = static' /etc/php5/fpm/pool.d/www.conf

RUN mkdir /etc/service/php5
ADD run.sh /etc/service/php5/run
RUN chmod 755 /etc/service/php5/run

EXPOSE 9000

CMD /sbin/my_init
