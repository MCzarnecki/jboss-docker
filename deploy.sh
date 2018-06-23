mvn clean package
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker build -t openshift/jboss .
docker run -p 8080:8080 -p 9990:9990 openshift/jboss
