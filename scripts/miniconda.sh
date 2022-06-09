########################################
# miniconda 
########################################
if [ $(arch) == 'arm64' ]
then
  miniconda_path=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
elif [ $(arch) == 'aarch64' ]
then
  miniconda_path=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
elif [ $(arch) == 'x86_64' ]
then
  miniconda_path=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
else
  echo "Unknown arch $(arch)"
  echo "update setup.sh script with new arch"
  exit 1;
fi

wget $miniconda_path -O $DEV_ENV_PACKAGE/miniconda3-latest.sh
zsh $DEV_ENV_PACKAGE/miniconda3-latest.sh
$DEV_ENV_PACKAGE/miniconda3/bin/conda init zsh
