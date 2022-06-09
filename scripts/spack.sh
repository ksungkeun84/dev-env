
# TODO: add script to clone spack repo later because I already did it.
echo "#---------------------- dev-evn spack ---------------" >> $HOME/.zshrc
echo "source /home/sungkeun/git/spack/share/spack/setup-env.sh" >> $HOME/.zshrc
echo "spack env activate base -p" >> $HOME/.zshrc
echo "module use --append /home/sungkeun/.local/glibc/modulefiles" >> $HOME/.zshrc
echo "module load gcc-12.1.0-gcc-4.8.5-rw6672f" >> $HOME/.zshrc
echo "#---------------------- dev-evn spack ---------------" >> $HOME/.zshrc
