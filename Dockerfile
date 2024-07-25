FROM ubuntu:latest

RUN bash

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y curl git neovim ripgrep fd-find python3.12-venv build-essential && \
    ln -s  $(which fdfind) /usr/local/bin/fd

# for javascript
RUN apt install -y nodejs npm && \
    npm install n -g && \
    n stable && \
    apt purge -y nodejs npm && \
    apt autoremove -y

COPY .config /root/.config
COPY .bash_aliases /root/.bash_aliases

RUN nvim +:UpdateRemotePlugins +qa
RUN nvim --headless -c "MasonInstallAll" -c qall
#RUN nvim --headless -c "MasonInstall lua-language-server" -c qall
#RUN nvim --headless -c "MasonInstall python-lsp-server" -c qall

