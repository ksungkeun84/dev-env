#!/bin
import argparse
import importlib
import sys
sys.path.append('python-cli-util')
from PythonCLIBase import PythonCLIBase


class Setup(PythonCLIBase):
    def __init__(self, args):
        super().__init__(args)

    def setup(self):
        # Git pull with submodule
        cmd = 'git submodule update --init --recursive'
        self.logger.info('Executing cmd: {0}'.format(cmd))
        super().execute_cmd(cmd)

        cmd = 'git submodule update --recursive --remote'
        self.logger.info('Executing cmd: {0}'.format(cmd))
        super().execute_cmd(cmd)

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

    #parser.add_argument("-l", "--llvm-path",
    #        type=str, help="Path to llvm binaries", required=True)
    #parser.add_argument("-r", "--build-path",
    #        type=str, help="Path to build", required=True)
    #parser.add_argument("-c", "--output-path",
    #        type=str, help="Path to output of dot file", required=True)

    args = parser.parse_args()
    main(args)
