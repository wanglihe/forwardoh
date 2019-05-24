====================
forwardoh
====================

forwardoh is a dns proxy that forward dns query to doh(dns over https) server.

common usage
====================

modify configure file config/forwardoh.conf, then run ./forwardoh -f config/forwardoh.conf.

meanings:
    - port: port for forwardoh to accept dns query. 
      default is 53 if missing this line.
    - url: doh server's url. you have to add domain bindings in /etc/hosts if url have domain name.
      default is https://127.0.0.1/ if missing this line.
    - cache_max: max number for cache responses. 
      default is 10000 if missing this line.
    - cache_refresh: refresh responses if time from last request to doh server is more than this value(in seconds). 
      default is 3600(an hour) if missing this line.
    - status_interval: display cache info every status_interval seconds.
      default is 300 if missing this line.

daemon usage
====================

put systemd/forwardoh.service into right place(e.g. /lib/systemd/system/forwardoh.service),

put config/forwardoh.conf into /etc/

then
::

    sudo make install
    sudo systemctl enable forwardoh
    sudo systemctl start forwardoh

make also accept DESTDIR and PREFIX

DNS server configure
====================

forwardoh will listen port supplied by configure file, and accept all UDP DNS querys
to the host forwardoh is running, no matter IPV4 or IPV6, any address bind to any
NIC. If forwardoh is running on localhost, just add 127.0.0.1 to /etc/resolv.conf
or network manage tools. If it is a remote server, do the same thing with remote
ip address.

why I wrote this tool
======================================

When I configure firefox to support doh, I found that /etc/hosts never works. I don't
know why firefox disable it, but I don't like the way firefox choose. So I think
I can proxy all dns query not only firefox but also for whole system.
