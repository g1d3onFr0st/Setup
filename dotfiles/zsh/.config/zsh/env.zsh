typeset -U path PATH

path=(
     "$HOME/.local/bin/"
     "$HOME/.nix-profile/bin"
     "/usr/local/bin/"
     "/usr/bin/"
     "/bin"
     "$HOME/.bun/bin/"
     $path
)
export PATH
 path=(${path:#/nix/var/nix/profiles/default/bin})
export EDITOR=nvim
export VISUAL=code
export GITHUB_TOKEN="$(gh auth token)"

export PAGER=bat
export TERMINAL=ghostty
export BROWSER=firefox-devedition
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_INSECURE=1
export PASSWORD_STORE_DIR="$HOME/.password-store/"


fpath=(
    "$HOME/.nix-profile/share/zsh/site-functions/"
    "$ZDOTDIR/completions/"
    $fpath
    )
