{% set swarm_worker_token = salt['mine.get']('role:docker-swarm-manager', 'swarm_worker_token', expr_form='grain') | dictsort() %}
{% set swarm_ipaddrs = salt['mine.get']('role:docker-swarm-manager', 'network.ip_addrs', expr_form='grain') | dictsort() %}

{% if swarm_worker_token %}
docker-swarm-worker-join:
  cmd.run:
    - name: "docker swarm join --token {{ swarm_worker_token[0][1] }} {{ swarm_ipaddrs[0][1][0] }}:2377"
    - unless: docker node ls
{% endif %}
