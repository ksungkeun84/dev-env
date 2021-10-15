cd dev-env

## Git pull with submodule

git submodule update --init --recursive

git submodule update --recursive --remote

## Setup nvim

mkdir docker-home; cd nvim-setup; ./setup.sh -h ../docker-home -m docker
(host) $> cd ..
(host) $> ./docker-run.sh
(docker) #> vi
(docker) #> :PlugInstall

## Initialize anaconda for gem5
(docker) #> conda init bash
(docker) #> exit
(host) $> ./docker-run.sh
(docker) #> conda activate gem5
(gem5) #>
