FROM ubuntu:20.04

RUN apt update
RUN apt clean

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt-get install -y python3 
RUN apt-get update
RUN apt-get install python3-pip -y
 
RUN apt install git -y
RUN apt update -y

RUN pip install databricks-cli==0.11.0

RUN groupadd -g $GROUP_ID akgrp && \
    useradd -u $USER_ID -g akgrp -ms /bin/bash -ms /bin/bash akusr
WORKDIR /tmp
RUN chown -R akusr:akgrp /tmp
RUN chmod -R 755 /home/akusr
USER akusr
COPY scripts/config.sh /tmp/scripts/config.sh
RUN chmod -R a+X /tmp/scripts/config.sh


#ARG VARIABLE_NAME
#ENV DATABRICKS_TOKEN_MAIN=$DATABRICKS_TOKEN_MAIN
#RUN /tmp/scripts/config.sh

# ENTRYPOINT ["/tmp/scripts/config.sh"]
