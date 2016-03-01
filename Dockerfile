FROM jenkins

ADD https://services.gradle.org/distributions/gradle-2.11-bin.zip /opt/gradle.zip
RUN unzip /opt/gradle.zip && rm /opt/gradle.zip

ENV GRADLE_HOME /opt/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
