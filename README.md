> **Installation guideline:** This is dockerized jenkins application with custom image. There are some instruction added in dockerfile.

# Docker installation

- run `` git clone https://github.com/Md-Ahatasham/dockerized-jenkins-with-custom-image.git ``
- cd `` dockerized-jenkins-with-custom-image ``
- run `` docker compose build ``
- run `` docker compose up -d ``
- then `` visit http://localhost:8099 ``

> **Administrator password:** When we browse the jenkins application first time it needs administration password.

**To get this:** do the followings
- run `` docker compose exec -it jenkins bash ``
- then `` cat/var/jenkins_home/secrets/initialAdminPassword ``
**you will get the password. Just paste and go forward**

