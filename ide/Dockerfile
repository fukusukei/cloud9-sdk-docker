FROM ubuntu:16.04

ARG USERNAME
# ARG PASSWORD
ARG GROUPNAME
ARG USERID=1000
ARG GROUPID=1000
ARG http_proxy
ARG https_proxy
ARG no_proxy

ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8

RUN apt-get update -y \
	&& apt-get install -y curl git sudo build-essential locales python language-pack-ja-base language-pack-ja \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
	&& apt-get clean \
	&& rm -fr /var/lib/apt/lists/* \
    && locale-gen ja_JP.UTF-8 \
    && localedef -f UTF-8 -i ja_JP ja_JP.utf8 \
    && groupadd -g ${GROUPID} ${GROUPNAME} \
    && useradd -d /home/${USERNAME} -m -s /bin/bash -u ${USERID} -g ${GROUPID} ${USERNAME} \
    && gpasswd -a ${USERNAME} sudo \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USERNAME}

USER ${USERID}

RUN git clone https://github.com/c9/core.git /home/${USERNAME}/cloud9 \
	&& cd /home/${USERNAME}/cloud9 \
	&& ./scripts/install-sdk.sh

COPY docker-entrypoint1.sh /

WORKDIR /home/${USERNAME}/workspace

ENTRYPOINT ["/docker-entrypoint1.sh"]
