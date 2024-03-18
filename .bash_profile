if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi


# for mac
export PATH="/opt/homebrew/bin:$PATH"

# for ubuntu
export PATH="/usr/local/bin:$PATH"

# Java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
