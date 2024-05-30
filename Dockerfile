FROM almalinux/arm64v8:9.3-base-20231124
LABEL maintainer="Matthew Tighe"
ARG user=devuser
RUN dnf update -y && \
    dnf install -y git iputils gnupg \
    nodejs zsh wget nano \
    nodejs npm bind-utils  && \
    adduser --shell /bin/zsh --comment "User" ${user} && \
    echo "devuser:<a href="mailto://p@ssword1">p@ssword1</a>" | \ 
    chpasswd &&  usermod -aG wheel devuser
USER ${user}
RUN cd
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
