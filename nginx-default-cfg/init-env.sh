# This file is executed when the server container is run and interpolates ENV variables into the config files below.

inject_env_vars() {
	## Replace only specified environment variables in specified file.
	envsubst '${ACCOUNT_HOST}' < ${NGINX_DEFAULT_CONF_PATH}/$1 > output.conf
	cp output.conf ${NGINX_DEFAULT_CONF_PATH}/$1
}

if [ -z "$ACCOUNT_HOST" ]; then
    export ACCOUNT_HOST=https://account.bitski.com
    echo "Using default account API host ${ACCOUNT_HOST}"
else
    echo "Using user defined account API host: ${ACCOUNT_HOST}"
fi

inject_env_vars "nginx.conf"
