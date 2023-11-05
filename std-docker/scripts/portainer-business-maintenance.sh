# #!/bin/bash
#
# Prune all unused images and update Portainer to latest
#
docker stop portainer
docker rm portainer

docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name=portainer \
    --restart=always --pull=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee:latest \
    --templates https://raw.githubusercontent.com/butterlan/butterlan-portainer-templates/main/templates.json
