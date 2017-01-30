mine_functions:
  network.ip_addrs: [eth0]
  swarm_manager_token:
    - mine_function: cmd.run_stdout
    - 'docker swarm join-token -q manager'
  swarm_worker_token:
    - mine_function: cmd.run_stdout
    - 'docker swarm join-token -q worker'
