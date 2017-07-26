#!/bin/bash
#
# docker-discourse ntrypoint script
# mainly used to make sure databes is migrated and assets precompiled
# 
# TODO: add ability to run stuff as a particular user/group (uid/gid)
#

cd /usr/src/app

echo "+-- migrating the db..."
bundle exec rake db:migrate

echo "+-- precompiling the assets..."
bundle exec rake assets:precompile

echo "+-- all done running the command:"
echo "    $@"
exec "$@"