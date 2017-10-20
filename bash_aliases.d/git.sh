alias gitamend='git commit --amend --no-edit'
alias gitrecommit='msg=$(git log --format="%s" -1) && git commit -m "$msg"'
alias gitcligui='tig'
alias gl="git log --oneline --graph --decorate --tags"

_gitignore()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(find /home/claudio/Documents/repos/GitHub/gitignore/ -maxdepth 1 -name "*.gitignore*" -type f | grep -o '[^/]*\.gitignore' | grep -o '^[^.]*')

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
function gitinit(){
  git init .
  if [ "$#" -gt 0 ]; then
    cp /home/claudio/Documents/repos/GitHub/gitignore/$1.gitignore .gitignore
    git add .gitignore && git commit -m "added gitignore $1 from GitHub"
  fi;
}
complete -F _gitignore gitinit

# Remove local branches without tracked branch on origin
function gitprunebranches(){
current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
if [ "$current_branch" != "master" ]; then
  echo "WARNING: You are on branch $current_branch, NOT master."
fi
echo -e "Fetching merged branches...\n"

git remote update --prune
remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")
if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
  echo "No existing branches have been merged into $current_branch."
  return 0;
fi

if [ -n "$remote_branches" ]; then
  echo "This will remove the following remote branches:"
  echo "$remote_branches"
  read -p "Continue? (y/n): " -n 1 choice
  echo
  if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    remotes=`echo "$remote_branches" | sed 's/\(.*\)\/\(.*\)/\1/g' | sort -u`

    # Remove remote branches
    for remote in $remotes
    do
      branches=`echo "$remote_branches" | grep "$remote/" | sed 's/\(.*\)\/\(.*\)/:\2 /g' | tr -d '\n'`
      git push $remote $branches
    done
  fi
fi

if [ -n "$local_branches" ]; then
  echo "This will remove the following local branches:"
  echo "$local_branches"
  read -p "Continue? (y/n): " -n 1 choice
  echo
  if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    locals="$local_branches"

    # Remove local branches
    for local in $locals
    do
      git branch -d $local
    done
  fi
fi
}

