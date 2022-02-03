#!/bin
import argparse
import importlib
import sys
import os
from typing import List
from pyclibase import pyclibase
from rich import traceback
from rich import print
from rich.logging import RichHandler
from rich import print
from rich.console import Console
from typing import List

program_name = 'Dev Env'
pyclibase.init_pycli(program_name, 'Dev Env', 'log.txt')

class Setup(pyclibase.pyclibase):
    def __init__(self, args, program_name):
        super().__init__(args, program_name)

    def setup(self, dev_env):
        console = Console()
        with console.status("[bold green]Working on tasks...") as status:

            # download nvim
            cmd = f'curl -fLo $HOME/.bin/nvim.appimage --create-dirs  https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage; chmod a+x $HOME/.bin/nvim.appimage'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            # install plug.vim
            cmd = f'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            cmd = f'mkdir -p $HOME/.config/nvim; cp {dev_env}/init.vim $HOME/.config/nvim/init.vim'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            cmd = f'cp {dev_env}/.bashrc $HOME/.bashrc'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            cmd = 'wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            cmd = 'bash Miniconda3-latest-Linux-x86_64.sh -b'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            #cmd = f'$HOME/miniconda3/bin/conda env create -f {dev_env}/miniconda-gem5.yml'
            #console.log(f"Executing {cmd}")
            #super().execute_cmd(cmd)

            cmd = f'$HOME/miniconda3/bin/conda env create -f {dev_env}/miniconda-gem5-21.2.yml'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            cmd = f'$HOME/miniconda3/bin/conda env create -f {dev_env}/miniconda-dcce.yml'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            #cmd = f'$HOME/miniconda3/bin/conda env create -f {dev_env}/miniconda-ml.yml'
            #console.log(f"Executing {cmd}")
            #super().execute_cmd(cmd)

            cmd = f'$HOME/miniconda3/bin/conda init bash'
            console.log(f"Executing {cmd}")
            super().execute_cmd(cmd)

            console.log("Exiting the docker-container... please login gain")
            cmd = f'exit'
            super().execute_cmd(cmd)


def main():
    parser = argparse.ArgumentParser(prog=program_name, description='...description...')
    parser.set_defaults(func=lambda x: parser.print_help())
    parser.add_argument(
        '-m',
        '--mode',
        type = str,
        choices=['docker', 'local'],
        required=True,
        help = ''
    )

    args = parser.parse_args()
    cli = Setup(args, program_name)
    if args.mode  == 'docker':
        cli.setup('$HOME/dev-env')
    elif args.mode == 'local':
        cli.setup('$PWD')

if __name__ == "__main__":
  sys.exit(main())
