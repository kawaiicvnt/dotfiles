#!/bin/zsh

# Function to find and update Git repositories
update_git_repos() {
    local start_path=$1
    local old_usernames=("V4NGBz" "Omp1" "sourkitten")
    local new_base_url="https://github.com/Amechania"

    # Find all .git directories and extract their parent directories
    for repo in $(find $start_path -type d -name ".git" 2>/dev/null); do
        repo_path=${repo:h}
        echo "Checking repository: $repo_path"

        # Change to the repository's parent directory
        cd $repo_path

        # Get the current remote URL
        current_remote=$(git remote get-url origin 2>/dev/null)

        # Check if the current remote matches any of the old usernames
        if [[ -n $current_remote ]]; then
            for username in $old_usernames; do
                if [[ $current_remote == *"github.com/$username"* ]]; then
                    # Extract the repository name from the current remote URL
                    repo_name=${current_remote##*/}

                    # Update the remote URL to use the new base URL with the extracted repo name
                    new_remote_url="$new_base_url/$repo_name"
                    echo "Updating remote URL for $repo_path"
                    git remote set-url origin $new_remote_url
                    echo "Updated remote URL to $new_remote_url"
                    break
                fi
            done
        else
            echo "No remote URL set for $repo_path or 'origin' does not exist."
        fi

        echo ""
    done
}

# Prompt the user for the start directory or use the current directory as default
read "start_path?Enter the directory to search for repositories (default is current directory): "
start_path=${start_path:-$(pwd)}

update_git_repos $start_path

