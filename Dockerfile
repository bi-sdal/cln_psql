FROM library/postgres
LABEL maintainer="Daniel Chen <chend@vt.edu>"

RUN apt-get -y update && \
    apt-get -y install cron emacs vim nano

COPY 00-cln_psql_bkup-pg_dumpall /etc/cron.daily/00-cln_psql_bkup-pg_dumpall

RUN chmod 777 /etc/cron.daily/00-cln_psql_bkup-pg_dumpall && \
    run-parts -v --test /etc/cron.daily

EXPOSE 5432
