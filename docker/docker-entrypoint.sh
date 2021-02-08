cd /src

# copy nginx config corresponding to the environment
cp docker/conf/nginx.conf /etc/nginx/sites-enabled/default

# creating the .env file used by the rails application using the environment variables
envsubst < docker/env.template > .env

# setting papertrail credentials in the config file for rsyslog
envsubst < docker/conf/log_files.yml > /etc/log_files.yml

# starting nginx
nginx -g 'daemon on;'

# starting supervisor
supervisord -c /etc/supervisord.conf