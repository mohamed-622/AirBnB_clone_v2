#!/usr/bin/python3
"""Fabric script that generates a .tgz archive"""
from fabric.api import *
from fabric.decorators import task

env.hosts = ['54.236.24.105', '34.229.49.43']


@task
def do_deploy(archive_path):
    """fabric script to deploy an archive to web servers"""
    try:
        with_ext = archive_path.split("/")[-1]
