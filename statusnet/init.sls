include:
  - git.init
  - apache.init
  - php.init

statusnet:
  git:
    - clone
    - cwd: /var/www/statusnet
    - repository: git://gitorious.org/statusnet/mainline.git
    - require:
      - pkg: git
      - pkg: apache
      - pkg: php

/var/www/statusnet/config.php:
  file:
    - managed
    - source: salt://statusnet/config.php
    - require:
      - git: statusnet
