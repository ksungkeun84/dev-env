```
    ____               ______
   / __ \___ _   __   / ____/___ _   __
  / / / / _ \ | / /  / __/ / __ \ | / /
 / /_/ /  __/ |/ /  / /___/ / / / |/ /
/_____/\___/|___/  /_____/_/ /_/|___/

```

# Docker based Dev environment setup (NVim Enabled)
![Docker based Dev environment setup (NVim Enabled)](https://github.com/ksungkeun84/dev-env/blob/master/dev-env-demo.gif)

## 1. Run the docker container.

```console
./docker-run.sh
```

## 2. Run the setup.py

```console
username@xxx: python3 setup.py -m docker
```

## 3. Setup Neovim

```console
username@xxx: vi
(command mode in vi) :PlugInstall
```

## Re run the docker container to activate conda env.

```console
(docker) username@xxx: conda init bash
(docker) username@xxx: exit
(host)   username@xxx: ./docker-run.sh
(docker) username@xxx: conda activate gem5
(gem5)   username@xxx:
```
