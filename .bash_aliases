### Custom aliases

alias ba='code ~/.bash_aliases'
alias open='xdg-open'
alias bas='source ~/.bashrc'

## ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

## apt
alias update='sudo apt update' #&& sudo apt upgrade'
# alias clean='sudo apt autoremove && sudo apt autoclean'

## directories
alias d="cd .."
alias matt='cd /media/mwojick/OS/Users/matth'
alias h='cd ~'
alias gh='cd /media/mwojick/OS/Users/matth/Documents/GitHub'
alias dl='cd ~/Downloads'
alias fs='cd /media/mwojick/OS/Users/matth/Documents/GitHub/App-Academy/FullStackProject/TreatPal/'
alias js='cd /media/mwojick/OS/Users/matth/Documents/GitHub/App-Academy/JavaScriptProject/'
alias fp='cd /media/mwojick/OS/Users/matth/Documents/GitHub/App-Academy/FlexProject/'
alias ap='cd /media/mwojick/OS/Users/matth/Documents/GitHub/App-Academy/JobSearch/AlgorithmsProjects/'
alias mo='cd /media/mwojick/OS/Users/matth/Documents/GitHub/moosiko/Moosiko_App/'

## git
function git_change_authorship {
  git filter-branch -f --env-filter "
    GIT_AUTHOR_NAME=\"\$1\"
    GIT_AUTHOR_EMAIL=\"\$2\"
    GIT_COMMITTER_NAME=\"\$1\"
    GIT_COMMITTER_EMAIL=\"\$2\"
  "
}
# usage: gca name email
# warning: this changes authorship of all previous commits
alias gca=git_change_authorship

alias gs='git status'
alias gl='git log'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gco='git checkout'
alias gp='git push'
alias ga='git add .'
alias gr='git remote -v'
alias gre='git reset'
alias gb='git branch'
alias gpl='git pull'
# ignore all untracked files
alias giu='git status -s | grep -e "^\?\?" | cut -c 4- >> .gitignore'

alias gm='git merge'

## databases
alias sql='sqlite3'
alias psql='psql'
alias pga='pgadmin3 &'

## bundle
alias bi='bundle install'
alias be='bundle exec'
alias ber='bundle exec rspec --color'

## ruby on rails
alias bea='bundle exec annotate'
alias rgm='bundle exec rails generate model'
alias rgc='bundle exec rails generate controller'
alias rc='bundle exec rails console'
alias rs='bundle exec rails server'
alias rst='bundle exec rails start'
alias rr='bundle exec rails routes'

## npm
alias ni='npm install'
alias ns='npm start'
alias nrs='npm run s'
# remove all node_modules in all folders within current dir
alias npm_purge='find . -type d -name node_modules -exec rm -rf {} +'

## heroku
alias herokures='heroku restart && heroku pg:reset DATABASE --confirm treat-pal && heroku run rails db:migrate && heroku run rails db:seed'
alias hpg='heroku pg:psql'

## mongoDB
alias mdb='mongo -u admin -p admin123 --authenticationDatabase admin'

## vs-code
alias c='code .'
# get list of all vscode extensions
alias vsc_ext='code --list-extensions | xargs -L 1 echo code --install-extension > ~/extensions.list'

# docker
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dps='docker ps'

function docker_bash() {
  docker exec -it "$1" bash;
}

# other
function kp() {
  lsof -ti:$1 | xargs kill
}

function git_commit() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  if [[ "$branch" = "master" ]]; then
    echo "Don't be dumb, this is master";
  else
    git commit -m "$1"
  fi
}