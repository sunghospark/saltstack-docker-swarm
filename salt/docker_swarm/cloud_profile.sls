/etc/salt/cloud.profiles.d/docker_swarm_ec2_profile.conf:
  file.managed:
    - source: salt://docker_swarm/files/docker_swarm_ec2_profile.conf
    - makedirs: True
    - mode: 600
    - template: jinja
    - user: root
    - group: root

/srv/salt/docker_swarm/manager_cloud_map.sls:
  file.managed:
    - source: salt://docker_swarm/files/manager_cloud_map.sls
    - makedirs: True
    - mode: 600
    - template: jinja
    - user: root
    - group: root

/srv/salt/docker_swarm/worker_cloud_map.sls:
  file.managed:
    - source: salt://docker_swarm/files/worker_cloud_map.sls
    - makedirs: True
    - mode: 600
    - template: jinja
    - user: root
    - group: root
