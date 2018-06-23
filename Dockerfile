FROM registry.access.redhat.com/jboss-eap-7/eap71-openshift

MAINTAINER Michał Czarnecki

RUN $JBOSS_HOME/bin/add-user.sh admin admin12345! --silent

#COPY resources/commands.txt $JBOSS_HOME
#USER root
#RUN chown jboss:jboss $JBOSS_HOME/commands.txt
#USER jboss
#RUN $JBOSS_HOME/bin/jboss-cli.sh --commands=embed-server,run-batch\ --file=$JBOSS_HOME/commands.txt,stop-embedded-server

COPY boot-webapp/target/BootApp.war $JBOSS_HOME/standalone/deployments/
USER root
RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/BootApp.war
USER jboss

EXPOSE 9990 8080
CMD ["/opt/eap/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
