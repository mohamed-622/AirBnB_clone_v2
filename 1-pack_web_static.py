#!/usr/bin/python3
"""Fabric script that generates a .tgz archive from the content of a folder"""
from fabric.api import local
from fabric.decorators import task


@task
def do_pack():
    """Function to generate a .tgz archive"""
    local("mkdir -p versions")
    tgz = local("tar -cvzf versions/web_static_$(date +%Y%m%d%H%M%S).tgz\
        web_static")
