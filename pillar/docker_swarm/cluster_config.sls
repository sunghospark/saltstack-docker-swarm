docker_swarm:
  dev:
    vpc_name: test-vpc
    secret: ohwowsuchlongsecuresecret
    auto_accept: True
    manager_instance_size: t2.small
    worker_instance_size: m4.large
    subnet_id:
      - subnet-12345678
      - subnet-abcdefgh
      - subnet-zxcvasdf
