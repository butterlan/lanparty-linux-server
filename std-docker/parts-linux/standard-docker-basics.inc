echo "### Setting up DOCKER basic components"

dnf -y config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo >> $LOGFILE 2>&1
dnf update -y >> $LOGFILE 2>&1
dnf -y install docker-ce >> $LOGFILE 2>&1

systemctl enable docker.service >> $LOGFILE 2>&1
systemctl start docker.service >> $LOGFILE 2>&1

echo "### Setting up PORTAINER for docker management"

if [ "$USE_PORTAINER_BUSINESS" == "yes" ]
then
    docker volume create portainer_data >> $LOGFILE 2>&1
    docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name=portainer \
        --restart=always --pull=always -v /var/run/docker.sock:/var/run/docker.sock \ 
        -v portainer_data:/data portainer/portainer-ee:latest \
        --templates https://bitbucket.org/apetomate/portainer-templates/raw/master/templates.json >> $LOGFILE 2>&1
else
    docker volume create portainer_data >> $LOGFILE 2>&1
    docker run -d -p 9443:9443 -p 8000:8000 --name=portainer --restart always \
           -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce \
           --templates https://bitbucket.org/apetomate/portainer-templates/raw/master/templates.json >> $LOGFILE 2>&1
fi
#eof
