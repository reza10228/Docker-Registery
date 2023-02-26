# docker-registry
1. install docker
2. install docker compose
3. get certificate for registry domain docker.domain.ir
(I do it with nginx then stop and disable nginx)
4. mkdir for docker-registry /opt/docker-registry
5. mkdir sub-directory to push docker images ./data
6. mkdir sub directory to store user/pass created with apache2-utils ==> htpasswd
7. cd to auth directory
8. run command:

        htpasswd -Bc registry.password username
    promp for new password
9. cd to docker-compose directory

        docker-compose up -d
---
# push to docker.domain.ir
1. ssh to production/development machine\
2. login docker with bellow command\

        docker login https://docker.domain.ir
    promp for user\
    then promp for pass\
    * notice that you set user/pass with **htpasswd** store in ./data
3. tag your docker image

        docker tag test-image docker.domain.ir/test-image:version_number
4. now push test-image

        docker push docker.domain.ir/test-image:version_number
---
# pull from docker.domain.ir
5. login docker with bellow command

        docker login https://docker.domain.ir
    promp for user\
    then promp for pass\

        docker pull docker.domain.ir/test-image:version_number
