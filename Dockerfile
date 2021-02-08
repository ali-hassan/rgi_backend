FROM ruby:2.4.2


#https://github.com/debuerreotype/docker-debian-artifacts/issues/66#issuecomment-476648047
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived
# Installing nodejs to have a javascript environment for coffee-script
RUN apt-get update && apt-get install -y git \
    nodejs \
    gettext \
    python-setuptools \
    build-essential \
    nginx \
    && easy_install supervisor \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && cp /usr/bin/envsubst /usr/local/bin/envsubst

#papertrail log
RUN curl -O -L https://github.com/papertrail/remote_syslog2/releases/download/v0.19/remote_syslog_linux_amd64.tar.gz && \
    tar -zxf remote_syslog_linux_amd64.tar.gz  && \
    cp remote_syslog/remote_syslog /usr/local/bin  && \
    rm -r remote_syslog_linux_amd64.tar.gz && \
    rm -r remote_syslog

RUN mkdir /var/log/supervisor/
RUN gem install bundler --conservative;

COPY . /src
WORKDIR /src
RUN bundle check; \
    bundle install; \
    bundle exec rake assets:precompile;

COPY docker/conf/supervisord.conf /etc/supervisord.conf

RUN ["chmod", "+x", "/src/docker/docker-entrypoint.sh"]

EXPOSE 80

CMD /src/docker/docker-entrypoint.sh
