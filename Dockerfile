FROM ubuntu:20.04

# hadolint ignore=DL3008,DL3009
RUN apt-get update && apt-get install -y --no-install-recommends \
  ansible \
  curl \
  git \
  gnupg \
  xz-utils

WORKDIR /opt/ansible

COPY hosts.yml autoware_build_env.yml /opt/ansible/
COPY roles/ /opt/ansible/roles/

RUN ansible-playbook -i hosts.yml autoware_build_env.yml -e yn_gpu=y \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN rm -rf /opt/ansible

CMD ["/bin/sh"]
