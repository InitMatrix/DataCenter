# -*- coding: utf-8 -*-#
# -------------------------------------------------------------------------------
# Name:         a 
# Author:       yepeng
# Date:         2021/10/22 2:44 下午
# Description: 
# -------------------------------------------------------------------------------
import argparse
import time

from tools import log

parser = argparse.ArgumentParser(description='manual to this script')
parser.add_argument("--target", type=str)
parser.add_argument("--node", type=str)
args = parser.parse_args()


def run():
    for i in range(100):
        # print(args.target)
        # print(args.node)
        print('--' * 10)
        log.debug(f"args: target={args.target} node={args.node}")
        time.sleep(2)


if __name__ == '__main__':
    run()
