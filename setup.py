#!/bin
import argparse
import importlib
import sys
import os
from pyclibase import pyclibase

pyclibase.clear_screen()
pyclibase.print_title('Dev Env')

class Setup(pyclibase.pyclibase):
    def __init__(self, args):
        super().__init__(args, 'dev-env setup')

    def setup(self):
        # Setup nvim
        cmd = 'mkdir docker-home; cd nvim-setup; bash setup.sh -h ../docker-home -m docker'
        self.logger.info('Executing cmd: {0}'.format(cmd))
        super().execute_cmd(cmd)


def main(args):
    setup = Setup(args)
    setup.setup()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
            description="DevEnv Setup program")

    args = parser.parse_args()
    main(args)
