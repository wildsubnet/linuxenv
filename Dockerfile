#FROM arm64v8/almalinux:9.4
FROM arm64v8/almalinux:10
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
#
# Install pip
#
RUN python3 -m ensurepip
RUN echo "export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH" >> $HOME/.zshrc
#
# Install Jupyter Notebook. IP 0.0.0.0 ensures it works with docker port binding
#
RUN $HOME/.local/bin/pip3 install notebook
RUN echo "alias jnote=\"jupyter notebook --ip 0.0.0.0 --notebook-dir=/vmshare\"" >> $HOME/.zshrc
