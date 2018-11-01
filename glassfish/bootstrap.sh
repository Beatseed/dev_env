yum update -y
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-edge
yum-config-manager --enable docker-ce-test
yum install -y docker-ce
systemctl enable docker 
systemctl start docker
usermod -aG docker $USER
curl -L https://github.com/docker/compose/releases/download/1.23.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /vagrant/data
docker swarm init
docker stack deploy -c docker-compose.yml lab
