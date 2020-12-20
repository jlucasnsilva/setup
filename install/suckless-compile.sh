target=$1
branch=$2

current=$(pwd)

echo "cd $target"
cd $target

echo "git checkout $branch"
git checkout $branch

echo "make install"
sudo make install

echo -e "finished\n"
cd $current
