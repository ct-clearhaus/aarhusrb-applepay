#!/bin/bash

echo 'alias p="docker run --rm -it -v /tmp/demo:/tmp/demo clearhaus/pedicel-pay"'
function p() {
    docker run --rm -it -v /tmp/demo:/tmp/demo clearhaus/pedicel-pay $@
}

p clean -p /tmp/demo/backend
p clean -p /tmp/demo/client

set -x

read; clear
p
read; clear
p help generate-backend
read; clear
p generate-backend -p /tmp/demo/backend
read; clear

p help generate-client
read; clear
p generate-client -p /tmp/demo/client -b /tmp/demo/backend
read; clear

p help generate-token
read; clear
p generate-token -b /tmp/demo/backend -c /tmp/demo/client | tee /tmp/demo/token.json
read; clear


set +x
cat <<EOC
docker run --rm -it -v /tmp/demo:/tmp/demo -v ~/src/clearhaus/pedicel:/p -w /p ruby:2.3 bash
bundle install --without development
irb -I lib -r pedicel -r json -r pp
EOC
