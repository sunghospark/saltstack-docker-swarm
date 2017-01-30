{% set swarm_manager_token = salt['mine.get']('role:docker-swarm-manager', 'swarm_manager_token', expr_form='grain') | dictsort() %}
{% if not swarm_manager_token %}
docker-swarm-init:
  cmd.run:
    - name: "docker swarm init"
    - unless: docker node ls

mine.update:
  module.run
{% else %}
{% set swarm_ipaddrs = salt['mine.get'](swarm_manager_token[0][0], 'network.ip_addrs') | dictsort() %}
docker-swarm-manager-join:
  cmd.run:
    - name: "docker swarm join --token {{ swarm_manager_token[0][1] }} {{ swarm_ipaddrs[0][1][0] }}:2377"
    - unless: docker node ls
mine.update:
  module.run
{% endif %}