{% set docker_swarm_env = salt.pillar.get('docker_swarm_env', 'dev') %}
{% set subnets = pillar['docker_swarm'][docker_swarm_env]['subnet_id'] %}
{% for index in range(1, (subnets|length)+1) %}
docker-swarm-worker-{{docker_swarm_env}}-{{index}}:
  - docker-swarm-worker-{{docker_swarm_env}}-{{index}}:
      grains:
        role:
          - docker-swarm
        env:
          - {{ docker_swarm_env }}
{% endfor %}