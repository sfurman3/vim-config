#!/usr/bin/env bash
read -p 'configuration name:' archive
archive="$(basename $archive)"
configdir="$(pwd | xargs basename)"
rm -rf .vimrc .vim $archive

# copy .vimrc and .vim/
mkdir $archive
cd $archive
cp ~/.vimrc ./
mkdir .vim
for file in `ls ~/.vim/ | grep -v $configdir`; do
    cp -R ~/.vim/$file .vim
done

# remove any .git repositories
find . \( -name '.git' -o -name '.gitignore' \) -exec rm -rf {} \;

# create the archive
cd ..
tar -cvf $archive.tar $archive
gzip $archive.tar

# clean up
rm -rf $archive

# mv archive to configs/
mv $archive.tar.gz configs
