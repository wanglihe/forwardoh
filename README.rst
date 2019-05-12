===================
forwardoh
===================

forwardoh is a dns proxy that forward dns query to doh(dns over https) server.

common usage
===================

modify a config file like config/forwardoh.conf, then run ./forwardoh -f config/forwardoh.conf.

meaning:
    - port: port for forwardoh accept dns query, default is 53.
    - url: doh server's url. if use domain name in url, then you have to add item in /etc/hosts.
    - cache_max: max number for cache responses
    - cache_refresh: refresh responses if time from last request to doh server is more than this value(in seconds). 
    - status_interval: output cache info every status_interval seconds.

daemon usage
===================

put systemd/forwardoh.service into right place(e.g. /lib/systemd/system/forwardoh.service),

put config/forwardoh.conf into /etc/

then 

::
    sudo make install
    sudo systemctl enable forwardoh
    sudo systemctl start forwardoh

make also accept DESTDIR and PREFIX

why I wrote this tool
======================================

When I configure firefox to support doh, I found that /etc/hosts never works. I don't
know why firefox disable it, but I don't like the way firefox choose. So I think
I can proxy all dns query not only firefox but also for other softwares.
