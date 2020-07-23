FROM ubuntu:18.04

RUN set -x \
    && apt-get update -y \
    && apt-get install --no-install-recommends -y \
        build-essential \
        automake \
        fakeroot \
        devscripts \
        dh-autoreconf \
        dh-make \
	libdistro-info-perl \
	curl \
	vim \
	less

RUN set -x \
    && apt-get autoremove --purge \
    && rm -rf /var/lib/apt/lists/*

