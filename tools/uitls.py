# -*- coding: utf-8 -*-#
# -------------------------------------------------------------------------------
# Name:         a 
# Author:       yepeng
# Date:         2021/10/22 2:44 下午
# Description: 
# -------------------------------------------------------------------------------
import platform
import json


def load_config() -> dict:
    with open('config.json', 'r') as f:
        return json.load(f)


def load_redis_config() -> dict:
    c = load_config()
    return c['redis']


def load_pg_config() -> dict:
    c = load_config()
    return c['postgres']


def load_docker_net():
    c = load_config()
    return c['network']


def is_dev_env() -> bool:
    """
    是否在宿主上运行
    :return: bool
    """
    return platform.system() in ("Windows", "Darwin")