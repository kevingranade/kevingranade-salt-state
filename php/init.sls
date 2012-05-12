php:
  pkg:
    - latest
#   - installed
#   - gt: 5.2.3

php-gd:
  pkg:
    - latest
    - require:
      - pkg: php
