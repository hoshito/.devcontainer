FROM ubuntu:24.04

RUN bash

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y curl git neovim ripgrep fd-find fzf && \
    ln -s  $(which fdfind) /usr/local/bin/fd

# for javascript
RUN DEBIAN_FRONTEND=noninteractive apt install -y nodejs npm && \
    npm install n -g && \
    n stable && \
    apt purge -y nodejs npm && \
    apt autoremove -y

RUN DEBIAN_FRONTEND=noninteractive apt install -y binutils build-essential golang sysstat python3-matplotlib python3-pil fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system

COPY config /root/.config
COPY bash_aliases /root/.bash_aliases
COPY gitconfig /root/.gitconfig

RUN nvim +:UpdateRemotePlugins +qa; exit 0
RUN nvim --headless -c "MasonInstallAll" -c qall; exit 0
#RUN nvim --headless -c "MasonInstall lua-language-server" -c qall
#RUN nvim --headless -c "MasonInstall python-lsp-server" -c qall

RUN adduser `id -un` libvirt && \
    adduser `id -un` libvirt-qemu && \
    adduser `id -un` kvm

RUN echo "set bell-style none" >> /etc/inputrc

