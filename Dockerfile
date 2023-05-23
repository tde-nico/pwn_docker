FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update --fix-missing
RUN apt install -y git gdb git wget patchelf file strace tmux python3 netcat
RUN apt install -y python3-pip ruby-full valgrind vim xclip elfutils checksec
# RUN apt install -y sagemath

WORKDIR /opt
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /opt/pwndbg
ENV LC_ALL=C.UTF-8
RUN ./setup.sh

WORKDIR /opt
RUN wget https://github.com/io12/pwninit/releases/download/3.3.0/pwninit
RUN chmod +x pwninit

RUN gem install one_gadget
RUN pip3 install requests pwntools z3-solver IPython icecream angr ropper

WORKDIR /chal
CMD bash