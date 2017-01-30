docker_swarm_asg:
  boto_asg.present:
    - name: docker_swarm_asg
    - launch_config_name: docker_swarm_lc
    - availability_zones:
      - us-west-2a
      - us-west-2b
      - us-west-2c
    - min_size: 3
    - max_size: 6
    - desired_capacity: 3
    - vpc_zone_identifier:
      - subnet-fb284ba2
      - subnet-937a32e4
      - subnet-dfedc7ba
    - scaling_policies:
      -
        adjustment_type: ChangeInCapacity
        as_name: docker_swarm_asg
        cooldown: 180
        min_adjustment_step: None
        name: DockerSwarmScaleDown
        scaling_adjustment: -1
      -
        adjustment_type: ChangeInCapacity
        as_name: docker_swarm_asg
        cooldown: 180
        min_adjustment_step: None
        name: DockerSwarmScaleUp
        scaling_adjustment: 1
    - region: us-west-2
    - alarms:
        CPU:
          name: 'DockerSwarm CPU ScaleUp'
          attributes:
            metric: CPUUtilization
            namespace: AWS/EC2
            statistic: Average
            comparison: '>='
            threshold: 70.0
            period: 60
            evaluation_periods: 30
            unit: null
            description: 'DockerSwarm High CPU scale up'
            alarm_actions: [ 'scaling_policy:self:ScaleUp' ]
            insufficient_data_actions: []
            ok_actions: []
        CPU:
          name: 'DockerSwarm CPU ScaleDown'
          attributes:
            metric: CPUUtilization
            namespace: AWS/EC2
            statistic: Average
            comparison: '<='
            threshold: 30.0
            period: 60
            evaluation_periods: 30
            unit: null
            description: 'ASG CPU'
            alarm_actions: [ 'scaling_policy:self:ScaleDown' ]
            insufficient_data_actions: []
            ok_actions: []
