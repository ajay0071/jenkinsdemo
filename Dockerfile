FROM almalinux:8

RUN for user in frank; do useradd $user; echo "1234" | passwd $user --stdin; done
RUN yum update -y && yum install mysql -y
