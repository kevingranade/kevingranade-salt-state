apache:
  pkg:
   - latest
#  - installed         # has a bug where it will not work unless a version is specified.
#  - gt: 2.2.0         # not supported by installed
#  - version: 2.2.22-3 # supported by installed, but not flexible enough
  service:
    - running
    - name: httpd
    - watch:
      - file: /etc/httpd/conf/httpd.conf
    - require:
      - user: apache
      - file: /etc/httpd/conf/vhosts.d
      - file: /var/www/default
  group:
    - present
    - require:
      - user: apache
  user:
    - present
    - shell: /bin/false
    - groups:
      - apache
    - require:
      - pkg: apache

# need to replace this guy with some vhost config files.
/etc/httpd/conf/httpd.conf:
  file:
    - managed
    - source: salt://apache/httpd.conf
    - require:
      - pkg: apache

/var/www:
  file:
    - directory

/var/www/default:
  file:
    - directory

/etc/httpd/conf/vhosts.d:
  file:
    - directory