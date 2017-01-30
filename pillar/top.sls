base:
  saltmaster:
    - aws.aws_profiles
    - aws.ubuntu_amis
    - docker_swarm.cluster_config
  'role:docker-swarm-manager':
    - match: grain
    - aws.aws_profiles
    - docker_swarm.cluster_config
    - docker_swarm.manager_mine
  'role:docker-swarm':
    - match: grain
    - aws.aws_profiles
