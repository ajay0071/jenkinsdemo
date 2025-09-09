FROM almalinux:8

RUN yum update -y && \
    yum install -y passwd shadow-utils && \
    for user in frank; do \
      useradd $user && echo "1234" | passwd --stdin $user; \
    done && \
    yum clean all

RUN yum install -y mysql
