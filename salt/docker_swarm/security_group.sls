{% set namespace = salt.pillar.get('namespace') %}
{% set docker_swarm_env = salt.pillar.get('docker_swarm_env', 'dev') %}
DockerSwarm-securitygroup-present:
  boto_secgroup.present:
      - name: dockerswarm-securitygroup
      - description: Security group for DockerSwarm cluster
      - rules:
          - ip_protocol: tcp
            from_port: 2377
            to_port: 2377
            source_group_name: dockerswarm-securitygroup
          - ip_protocol: tcp
            from_port: 4789
            to_port: 4789
            source_group_name: dockerswarm-securitygroup
          - ip_protocol: udp
            from_port: 4789
            to_port: 4789
            source_group_name: dockerswarm-securitygroup
          - ip_protocol: tcp
            from_port: 7946
            to_port: 7946
            source_group_name: dockerswarm-securitygroup
          - ip_protocol: udp
            from_port: 7946
            to_port: 7946
            source_group_name: dockerswarm-securitygroup
      - keyid: {{ pillar['aws_profiles'][namespace]['aws_access_key_id'] }}
      - key: {{ pillar['aws_profiles'][namespace]['aws_secret_access_key'] }}
      - region: {{ grains['ec2']['region'] }}
      - vpc_name: {{ pillar['docker_swarm'][docker_swarm_env]['vpc_name'] }}
