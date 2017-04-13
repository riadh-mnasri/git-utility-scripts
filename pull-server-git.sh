#!/bin/bash
# Store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo "Pulling in latest changes for all repositories in folder "$CUR_DIR "..."

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "Repo :: "$i;

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

	# save temporary work
	echo "Saving temporary work : "$i;
	git stash
	
    # finally pull
	echo "Pulling remote server : "$i;
    git pull --rebase origin master;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "Finished!"