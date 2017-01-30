{% set docker_swarm_env = salt.pillar.get('docker_swarm_env', 'dev') %}
{% set subnets = pillar['docker_swarm'][docker_swarm_env]['subnet_id'] %}
{% for index in range(1, (subnets|length)+1) %}
docker-swarm-manager-{{docker_swarm_env}}-{{index}}:
  - docker-swarm-manager-{{docker_swarm_env}}-{{index}}:
      minion:
        mine_interval: 5
      grains:
        role:
          - docker-swarm-manager
        env:
          - {{ docker_swarm_env }}
  - docker-swarm-manager-{{docker_swarm_env}}-{{index}}:
      minion:
        mine_interval: 5
      grains:
        role:
          - docker-swarm-manager
        env:
          - {{ docker_swarm_env }}
{% endfor %}