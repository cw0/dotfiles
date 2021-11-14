FROM ubuntu:22.04
COPY . /home/dotfiles
WORKDIR /home/dotfiles
RUN chmod +x setup.sh
RUN ./setup.sh
