FROM debian:bullseye


RUN apt update -y
RUN apt install wget -y && wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && chmod +x cadvisor


CMD ["./cadvisor", "--port", "2468"]
