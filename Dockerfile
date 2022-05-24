FROM    debian

ENV     DEBIAN_FRONTEND=noninteractive

RUN     apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y \
            apt-utils \
            git \
            man-db \
            shellcheck \
            ssh \
            stow \
            sudo \
            tmux \
            tree \
            vim.tiny \
            w3m \
            && \
        rm -r /etc/skel && \
        mkdir /etc/skel && \
        useradd -m \
            -G sudo \
            -s /bin/bash \
            joss\
        && \
        passwd -d joss && \
        su -c ' \
            git clone \
                https://github.com/jaf7C7/Workspace \
                /home/joss/Workspace \
            && \
            git -C /home/joss/Workspace \
                remote set-url origin \
                git@github.com:jaf7C7/Workspace \
            && \
            stow -vd /home/joss/Workspace dotfiles \
        ' \
        joss

CMD     login -f joss

