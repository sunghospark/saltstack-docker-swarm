/home/ubuntu/.aws/config:
  file.managed:
    - source: salt://aws/config
    - makedirs: True
    - mode: 600
    - template: jinja
    - user: ubuntu
    - group: ubuntu

/home/ubuntu/.aws/credentials:
  file.managed:
    - source: salt://aws/credentials
    - mode: 600
    - template: jinja
    - user: ubuntu
    - group: ubuntu

/root/.aws/config:
  file.managed:
    - source: salt://aws/config
    - makedirs: True
    - mode: 600
    - template: jinja
    - user: ubuntu
    - group: ubuntu

/root/.aws/credentials:
  file.managed:
    - source: salt://aws/credentials
    - mode: 600
    - template: jinja
    - user: ubuntu
    - group: ubuntu

python-pip:
  pkg.installed

upgrade-pip:
  cmd.run:
    - name: pip install -U pip

awscli:
  pip.installed
