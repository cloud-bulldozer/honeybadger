FROM quay.io/operator-framework/ansible-operator:v1.5.0
USER root

COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY image_resources/centos8-appstream.repo /etc/yum.repos.d/centos8-appstream.repo
RUN dnf install -y --nodocs redis openssl --enablerepo=centos8-appstream && dnf clean all

COPY resources/kernel-cache-drop-daemonset.yaml /opt/kernel_cache_dropper/
COPY group_vars/ ${HOME}/group_vars/
COPY roles/ ${HOME}/roles/
COPY templates/ ${HOME}/templates/
COPY meta/ ${HOME}/meta/
COPY watches.yaml ${HOME}/watches.yaml
COPY playbook.yml ${HOME}/playbook.yml
USER 1001
