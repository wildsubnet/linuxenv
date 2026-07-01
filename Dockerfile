#FROM arm64v8/almalinux:9.4
FROM arm64v8/almalinux:10
LABEL maintainer="Matthew Tighe"
RUN dnf update -y && \
    dnf install -y git iputils gnupg \
    nodejs zsh wget nano net-tools \
    nodejs npm bind-utils procps 
#    adduser --shell /bin/zsh --comment "User" ${user} && \
#    echo "$user:p@ssword1" | \ 
#    chpasswd &&  usermod -aG wheel "$user"
RUN cd
#RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#
# Install pip
#
RUN python3 -m ensurepip && python3 -m pip install --upgrade pip
RUN echo "export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH" >> $HOME/.zshrc
#
# Install Jupyter Notebook. IP 0.0.0.0 ensures it works with docker port binding
#
RUN python3 -m pip install notebook
RUN echo "alias jnote=\"jupyter notebook --allow-root --ip 0.0.0.0 --notebook-dir=/vmshare\"" >> $HOME/.zshrc
