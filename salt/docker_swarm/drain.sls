drain-manager-node:
  cmd.run:
    - name: "docker node update --availability drain `docker info | grep 'NodeID: .*' | cut -f2- -d':'`"
