base:
  '*jenkins*':
    - jenkins.cleanup_docker_images
    - aws.jenkins_init
    - jenkins.setup_artifactory_cert
    - jenkins.setup_pes_stash_cert
    - jenkins.setup_pypirc
  saltmaster:
    - aws
  'role:docker-swarm':
    - match: grain
    - aws
    - docker_swarm.install
    - docker_swarm.swarm_join
    - nikepipe.install
  'role:docker-swarm-manager':
    - match: grain
    - aws
    - docker_swarm.install
    - docker_swarm.swarm_init
    - docker_swarm.drain
    - nikepipe.install
