# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/apelsinet/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
DEFAULT_USER=apelsinet

export PATH=/usr/local/bin:$PATH
# export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2

# Virtualenv config
export WORKON_HOME=~/.envs
source /usr/local/bin/virtualenvwrapper.sh

alias vi="nvim"
alias svi="sudo nvim"
alias vim="nvim"
alias svim="sudo nvim"

# ES server shortcuts
alias pyb="cd ~/w/Epidemic-Music-Server/services/src/ && pipenv run python manage.py runserver 8001"
alias pya="workon es_activity && python ~/w/activity-service/run.py"
alias pyf="cd ~/w/Epidemic-Music-Server/frontend/src/ && pipenv run python manage.py runserver 8002"
alias reactf="cd ~/w/Epidemic-Music-Server/homepage && npm start"

# export PATH="$PATH:`yarn global bin`"

function s { grep -r "$1" . --color; }



# eval "$(_TMUXP_COMPLETE=source tmuxp)"
alias work="tmuxp load work"

alias t="todolist"




function jupyter() {
	docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
}

source ~/aws_credentials.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

export EDITOR="/usr/local/bin/nvim"
