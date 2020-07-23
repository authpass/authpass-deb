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
	vim \
	less

RUN set -x \
    && apt-get autoremove --purge \
    && rm -rf /var/lib/apt/lists/*

