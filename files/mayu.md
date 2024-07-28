<`html>

---
title: "docker: mayuのビルド"
date: 2023/06/26
---

ubuntu20である必要はないので、18を使う。

- Dockerファイルを用意
    ```Dockerfile
    #FROM ubuntu:18.04 AS build
    FROM ubuntu:24.04 AS build

    ENV TZ=Asia/Tokyo
    RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

    RUN apt -y update
    RUN apt install -y gcc g++ libboost-all-dev libudev-dev libusb-1.0-0-dev make
    RUN apt install -y git
    RUN mkdir /source
    WORKDIR /source
    RUN git clone https://github.com/oonishi870/mayu.git -b feature/bluetooth \
        && cd mayu                                                            \
        && git checkout aecb821a252e7cde8fc052e565c86ff05b35553f
    WORKDIR /source/mayu
    RUN ./configure --with-boost-libdir=/usr/lib/x86_64-linux-gnu/
    RUN make CXXFLAGS="-Wno-narrowing -pthread"

    #FROM ubuntu:18.04
    FROM ubuntu:24.04

    ENV TZ=Asia/Tokyo
    RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

    RUN apt -y update
    #RUN apt search libboost-regex
    #RUN apt install -y libboost-regex1.65.1 libusb-1.0-0
    RUN apt install -y libboost-regex1.83.0 libusb-1.0-0

    COPY --from=build /source/mayu/mayu /bin/mayu

    RUN mkdir /mayu
    WORKDIR /mayu

    RUN printf '#!/bin/bash \n\
    while [ 1 = 1 ]; do     \n\
      /bin/mayu;            \n\
      sleep 1               \n\
    done                    \n\
    '> /mayu/mayu.bash
    RUN chmod a+x /mayu/mayu.bash    

    COPY --from=build /source/mayu/*.mayu /mayu/
    ENV HOME=/mayu
    #CMD ["/bin/mayu"]
    #CMD ["/bin/bash", "/mayu/mayu.bash"]
    CMD ["/mayu/mayu.bash"]
    
    ```

- イメージのビルド
    ```bash
    #!/bin/bash
    cd $(mktemp -d)
    ~/bin/mdcoderun [::mdpath::] -i [::index-1::] --show > Dockerfile
    #sudo docker build -t mayu-dev -f Dockerfile .
    sudo docker build -t mayu:ubuntu24.04 -f Dockerfile .

    ```
    
- test

```bash
    docker run                                               \
           --rm                                              \
           -i                                                \
           --name mayu2                                       \
           -v ~/mayu.d/main.mayu:/mayu/.mayu                 \
           -v ~/mayu.d/mydvorak.mayu:/mayu/mydvorak.mayu     \
           -v ~/mayu.d/myshortcut.mayu:/mayu/myshortcut.mayu \
           mayu-dev bash -i

```

- コンテナ内でmayuのビルド実行
    ```bash
    docker run                           \
           --rm                          \
           -i                            \
           -v /home/owner/Dropbox/surface-go/github/mayu:/home/owner/Dropbox/surface-go/github/mayu \
           -v /etc/passwd:/etc/passwd:ro \
           -v /etc/group:/etc/group:ro   \
           -u $(id -u):$(id -g)          \
           mayu-build bash <<EOF
    cd /home/owner/Dropbox/surface-go/github/mayu
    make clean
    ./configure --with-boost-libdir=/usr/lib/x86_64-linux-gnu/
    make  CXXFLAGS=-Wno-narrowing
    EOF

    ```


okimatsuraa/mayu:ubuntu24.04
