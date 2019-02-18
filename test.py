


#!/usr/bin/env python
#-*- coding: utf-8 -*-
#date:2019/01/22
#filename: test.py (only for test python scripts)
#author: cod777.co

import docker

client = docker.Client(base_url='unix:///var/run/docker.sock')

for component,version in client.version().iteritems():
    print component,version
    
    
    
    
