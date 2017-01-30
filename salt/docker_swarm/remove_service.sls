{% set service = salt.pillar.get('docker_service') %}
{% set service_ps = salt.cmd.run_stdout("docker service ps " + service['name']) %}
{% if service_ps %}
remove-docker-service:
  cmd.run:
    - name: docker service rm {{ service['name'] }}
{% endif %}
