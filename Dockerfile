FROM python:3.6.10-slim-stretch

LABEL maintainer="Mujahid Khaleel <mujahidkhaleel@gmail.com>"

ENV PATH="${PATH}:/root/.local/bin"

RUN apt update && \
   apt install -y wget git groff jq vim dos2unix zsh tree tmux neofetch less && \
   pip install 'ansible==2.7.10' awscli boto botocore boto3 --user && \
   echo "Y" | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
   git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim && \
   chsh -s $(which zsh)

RUN mkdir -p /root/.ssh/ && \
   mkdir -p /root/.aws

COPY .vimrc /root/
COPY .zshrc /root/
COPY .tmux.conf /root/

WORKDIR /root/

ENTRYPOINT ["zsh"]
