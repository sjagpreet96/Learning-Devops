nginx unreachable from browser checked status, ports, network rules all was fine the isse was in browser it was accessing as https rather than http solved by changing to http
unable to clone repo, not added rread permission during token genration
error in installing requirment.txt solved with installing sudo apt install python3-dev default-libmysqlclient-dev build-essential pkg-config -y
faced error of missing tables in databse not created after migration as well fixed with python manage.py migrate --run-syncdb to crete tables.
nginx not listening port 80 aftre chaning deafult in available sites forget to enable it done using sudo ln -s /etc/nginx/sites-available/django /etc/nginx/sites-enabled/