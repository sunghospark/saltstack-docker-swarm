{% set service = salt.pillar.get('docker_service') %}
{% set service_ps = salt.cmd.run_stdout("docker service ps " + service['name']) %}
{% set service_options = "" %}
{% set service_options = service['options'] if service['options'] is defined %}
{% if service_ps %}
update-docker-service:
  cmd.run:
{% if service_options is defined %}
    - name: docker service update {{ service_options }} --image {{ service['image'] }} {{ service['name'] }}
{% else %}
    - name: docker service update --image {{ service['image'] }} {{ service['name'] }}
{% endif %}
{% else %}
{% set service_options = service_options + " " + service['ports'] if service['ports'] is defined %}
create-docker-service:
  cmd.run:
{% if service_options is defined %}
    - name: docker service create {{ service_options }} --name {{ service['name'] }} {{ service['image'] }}
{% else %}
    - name: docker service create --name {{ service['name'] }} {{ service['image'] }}
{% endif %}
{% endif %}
