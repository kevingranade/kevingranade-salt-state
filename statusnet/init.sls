include:
  - git
  - apache
  - php

# workaround until git module is stable or at least generally available.
statusnet-install:
  cmd:
    - run
    - name git clone git://gitorious.org/statusnet/mainline.git /var/www/statusnet
    - unless: [ -d /var/www/statusnet ]
    - require:
      - pkg: git
      - pkg: apache
      - pkg: php
      - file: /var/www

# prefer this if I have master/minions that suport git directive
#statusnet-install:
#  git:
#    - latest
#    - name git://gitorious.org/statusnet/mainline.git
#    - rev: mainline
#    - target: /var/www/statusnet
#    - require:
#      - pkg: git
#      - pkg: apache
#      - pkg: php
#      - file: /var/www

/var/www/statusnet/config.php:
  file:
    - managed
    - source: salt://statusnet/config.php
    - require:
      - cmd: statusnet-install
