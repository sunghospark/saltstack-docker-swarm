clean_mine_cache:
  cmd.run:
    - name: rm /var/cache/salt/master/minions/*/mine.p
    - onlyif: ls /var/cache/salt/master/minions/*/mine.p

update_mine:
  salt.function:
    - name: mine.update
    - tgt: '*'

create_security_group_and_cloud_profile:
  salt.state:
    - tgt: saltmaster
    - sls:
      - docker_swarm.security_group
      - docker_swarm.cloud_profile

create_manager_cluster:
  salt.runner:
    - name: cloud.map_run
    - path: /srv/salt/docker_swarm/manager_cloud_map.sls
    - parallel: False

create_worker_cluster:
  salt.runner:
    - name: cloud.map_run
    - path: /srv/salt/docker_swarm/worker_cloud_map.sls
    - parallel: True
