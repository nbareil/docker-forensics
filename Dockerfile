FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections


RUN apt-get update &&                           \
    apt-get -y upgrade &&                       \
    apt-get install -y --no-install-recommends  \
               python-pip                       \
               vim                              \
               ntfs-3g                          \
               python-geoip                     \
               ssdeep                           \
               yara                             \
               python-yara                      \
               sleuthkit                        \
               mac-robber                       \
               kpartx                           \
               parted                           \
               parallel                         \
               wireshark                        \
               python-fuse                      \
               python-wxgtk3.0                  \
               python-jinja2                    \
               python-lxml                      \
               libbde-utils                     \
               libfuse-dev                      \
               tshark &&                        \
    rm -rf /var/cache/apt/archives/*deb /var/lib/apt/lists/*


RUN pip install                                                                                                    \
           https://github.com/williballenthin/python-registry/archive/acec3e995f8c8f4bc82d447a631a4039d91002c2.zip \
           https://github.com/williballenthin/python-ntfs/archive/506293d68ae0324fa149dbcc6ffe618f29295b50.zip     \
           https://github.com/williballenthin/python-evtx/archive/e645d4de8ee87e20665b42b8805e5702ac076a0d.zip     \
           https://github.com/log2timeline/plaso/archive/cb1beb1640505293776c8a34c4a849975ef28bbe.zip              \
           https://github.com/williballenthin/INDXParse/archive/83dae169b79a466bc49432b33d4415f2d63a2d7d.zip               \
           https://github.com/nbareil/shellbags/archive/6ed191fdf686fdffced9498130f79660b5b0daa6.zip

RUN apt-get update && \
    apt-get install -yyyy --no-install-recommends automake autoconf2.13 autopoint libtool make wget && \
    rm -rf /var/cache/apt/archives/*deb /var/lib/apt/lists/*

RUN wget https://github.com/libyal/libvshadow/releases/download/20170902/libvshadow-alpha-20170902.tar.gz &&       \
    tar zxvf libvshadow-alpha-20170902.tar.gz && \
    (cd libvshadow-20170902 && ./configure && make -j12 install) && \
    rm -fr libvshadow-20170902 libvshadow-alpha-20170902.tar.gz

RUN wget https://github.com/libyal/libvmdk/releases/download/20170226/libvmdk-alpha-20170226.tar.gz && \
    tar xf libvmdk-alpha-20170226.tar.gz && \
    (cd libvmdk-20170226 && ./configure && make -j 12 && make install) && \
    rm -fr libvmdk-20170226 libvmdk-20170226.tar.gz

RUN wget https://github.com/libyal/libvhdi/releases/download/20170223/libvhdi-alpha-20170223.tar.gz && \
    tar xf libvhdi-alpha-20170223.tar.gz && \
    (cd libvhdi-20170223 && ./configure && make -j 12 install) && \
    rm -fr libvhdi-alpha-20170223.tar.gz libvhdi-20170223

RUN pip install distorm3
RUN ldconfig

CMD bash
