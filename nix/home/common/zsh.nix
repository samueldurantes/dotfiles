_:

{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ls = "ls --color";
    };

    initExtra = ''
      export ZSH="$HOME/.oh-my-zsh"

      ZSH_THEME="dst"

      plugins=(git)

      source $ZSH/oh-my-zsh.sh

      ### Added by Zinit's installer
      if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
          print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
          command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
          command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
              print -P "%F{33} %F{34}Installation successful.%f%b" || \
              print -P "%F{160} The clone has failed.%f%b"
      fi

      source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
      autoload -Uz _zinit
      (( ''${+_comps} )) && _comps[zinit]=_zinit

      # Plugin history-search-multi-word loaded with investigating.
      zinit load zdharma-continuum/history-search-multi-word

      # Two regular plugins loaded without investigating.
      zinit light zsh-users/zsh-autosuggestions
      zinit light zdharma-continuum/fast-syntax-highlighting

      # Snippet
      zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

      export NVM_DIR="$([ -z "''${XDG_CONFIG_HOME-}" ] && printf %s "''${HOME}/.nvm" || printf %s "''${XDG_CONFIG_HOME}/nvm")"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

      export PATH=~/.yarn/bin:$PATH

      unalias -m 'gh'
      unalias -m 'go'

      alias gprc="git pu && gh pr create --fill"
      alias glo="git pu && gh pr create --fill && gh pr merge -sd --admin"
      alias gbd="git branch | grep -v "main" | xargs git branch -D"
      alias gfap="git fetch --all --prune"
      alias gall="git coma && git poma && gbd && gfap"

      alias nd="nix develop --command \"$SHELL\""

      export ELASTIC_APM_ACTIVE=false
      export TZ=utc

      export ADMIN_WEBPACK_LOADER=swc
      export PATH="$PATH:/Users/samueldurante/.local/bin"

      alias vim=nvim
      alias vi=nvim

      # opam configuration
      [[ ! -r /Users/samuel/.opam/opam-init/init.zsh ]] || source /Users/samuel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

      # pnpm
      export PNPM_HOME="/Users/samuel/Library/pnpm"
      case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
      esac
      # pnpm end
    ''; #
  };
}
