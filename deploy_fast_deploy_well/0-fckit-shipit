from fabric.api import *

env.user = 'admin'

env.hosts = ['158.69.92.186']

dist = "mywebapp"
maintenance_file = "maintenance.trigger"


def pack():
    '''Clone twitter clone repo and create a zipfile.'''
    local('git clone https://github.com/bennettbuchanan/twitter_clone && cd twitter_clone')
    local("tar --exclude='*.tar.gz' -cvzf %s.tar.gz ." % dist)


def deploy():
    '''Unpack the tarfile and copy into the site's root on the webserver.'''
    put('%s.tar.gz' % dist, '/tmp/%s.tar.gz' % dist)
    run('sudo mkdir /tmp/%s' % dist)
    run('sudo tar -xzf /tmp/%s.tar.gz -C /var/www/html' % dist)
    run('sudo rm -rf /tmp/%s /tmp/%s.tar.gz' % (dist, dist))
    local('rm -rf mywebapp.tar.gz twitter_clone')


def maintenance_on():
    '''Add maintenance.trigger file to redirect users to maintenance.html and
    return a 503 status. See .htaccess file.
    '''
    run('sudo touch /var/www/html/%s' % maintenance_file)


def maintenance_off():
    '''Remove maintenance.trigger file to redirect users to maintenance.html
    and return a 200 status. See .htaccess file.
    '''
    run('sudo rm /var/www/html/%s' % maintenance_file)
