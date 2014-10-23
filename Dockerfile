FROM debian:jessie

RUN apt-get update &&                           \
    apt-get upgrade &&                          \
    apt-get install -y --no-install-recommends  \
                    python-pip                  \
                    vim &&                      \
    rm -rf /var/cache/apt/archives/*deb /var/lib/apt/lists/*

RUN apt-get update &&                           \
    apt-get install -y --no-install-recommends  \
               python-pip                       \
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
               tshark &&                        \
    rm -rf /var/cache/apt/archives/*deb /var/lib/apt/lists/*


RUN pip install                                                                                                    \
           https://github.com/williballenthin/python-registry/archive/201238f06cf24c39a10371def9aea5d503102c09.zip \
           https://github.com/williballenthin/python-ntfs/archive/1b2341c7bdbc4cbdcdecff24b551250f441e3d2c.zip     \
           https://github.com/williballenthin/python-evtx/archive/e645d4de8ee87e20665b42b8805e5702ac076a0d.zip     \
           https://github.com/log2timeline/plaso/archive/cb1beb1640505293776c8a34c4a849975ef28bbe.zip              \
           https://github.com/nbareil/INDXParse/archive/c50622d8938ac894058960c7098c5cd4366183cc.zip               \
           https://github.com/nbareil/shellbags/archive/6ed191fdf686fdffced9498130f79660b5b0daa6.zip

CMD bash
