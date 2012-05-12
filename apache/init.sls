apache:
  pkg:
   - latest
#  - installed         # has a bug where it will not work unless a version is specified.
#  - gt: 2.2.0         # not supported by installed
#  - version: 2.2.22-3 # supported by installed, but not flexible enough
  service:
    - running
    - watch:
      -file: /etc/httpd/conf/httpd.conf

# need to replace this guy with some vhost config files.
/etc/httpd/conf/httpd.conf:
  file:
    - managed
    - source: salt://apache/httpd.conf
    - require:
      - pkg: apache
