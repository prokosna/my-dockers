FROM java:openjdk-8-jdk

RUN \
  apt-get update && \
  apt-get install -y openssh-server && \
  mkdir -p /var/run/sshd

# Add jenkins user and configure credentials
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG home=/home/jenkins
ADD jenkins_rsa.pub /tmp
RUN \
  groupadd -g ${gid} ${group} && \
  useradd -d ${home} -u ${uid} -g ${gid} -m -s /bin/bash ${user} && \
  mkdir -p ${home}/.ssh && \
  mv /tmp/jenkins_rsa.pub ${home}/.ssh/authorized_keys && \
  chown ${user}:${group} ${home}/.ssh/authorized_keys && \
  chmod 400 ${home}/.ssh/authorized_keys

CMD /usr/sbin/sshd -D
