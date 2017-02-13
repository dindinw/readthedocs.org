# ReadTheDocs (RTD) Docker
# 

FROM        centos:latest

MAINTAINER  https://github.com/dindinw/readthedocs.org

ENV         BASEDIR /rtd

WORKDIR     $BASEDIR

RUN         yum install -y epel-release.noarch && yum update -y 
RUN         yum install -y gcc python-devel python-pip \
                git libxml2-devel xmlsec1-devel make \
         && yum clean all 

RUN         git clone https://github.com/dindinw/readthedocs.org.git

WORKDIR     $BASEDIR/readthedocs.org

RUN         pip install -r requirements.txt   

CMD         ["/bin/bash"]
