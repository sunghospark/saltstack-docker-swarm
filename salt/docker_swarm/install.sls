{% if grains['os'] == 'Ubuntu' %}
apt-transport-https:
  pkg.installed

ca-certificates:
  pkg.installed

docker-ubuntu-repo:
  pkgrepo.managed:
    - name: deb https://apt.dockerproject.org/repo ubuntu-trusty main
    - file: /etc/apt/sources.list.d/docker.list
    - keyserver: hkp://p80.pool.sks-keyservers.net:80
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - require_in:
      - pkg: docker-engine

lxc-docker:
  pkg.purged

apparmor:
  pkg.installed

{% endif %}

docker-engine:
  pkg.installed

docker:
  service.running:
    - enable: True

