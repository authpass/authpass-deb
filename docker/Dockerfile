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
	dput \
	curl \
	vim \
	less \
	ca-certificates \
    git

RUN apt-get install --no-install-recommends -y libatk1.0-0  libc6  libcairo-gobject2  libcairo2  libgcc1  libgdk-pixbuf2.0-0  libgl1 libglib2.0-0  libgtk-3-0  libpango-1.0-0  libpangocairo-1.0-0  libstdc++6  libx11-6 libxcursor1  libxinerama1 libxrandr2  libxxf86vm1 libsecret-1-dev libegl1

RUN set -x \
    && apt-get autoremove --purge \
    && rm -rf /var/lib/apt/lists/*

