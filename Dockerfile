FROM jaohaohsuan/jenkins-for-volumes-docker:latest

ENV JENKINS_UC https://updates.jenkins-ci.org
# COPY src/main/docker/plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh kubernetes github 

# ENV VERSION 0.4-SNAPSHOT
# COPY target/kubernetes.hpi /usr/share/jenkins/ref/plugins/kubernetes.hpi
# RUN curl -o /usr/share/jenkins/ref/plugins/kubernetes.hpi \
#  http://repo.jenkins-ci.org/snapshots/org/csanchez/jenkins/plugins/kubernetes/0.4/kubernetes-$VERSION.hpi

# remove executors in master
COPY src/main/docker/master-executors.groovy /usr/share/jenkins/ref/init.groovy.d/

# ENV JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties"
