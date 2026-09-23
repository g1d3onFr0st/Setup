typeset -U path PATH

path=(
     "$HOME/.local/bin/"
     "$HOME/.nix-profile/bin"
     "/usr/local/bin/"
     "/usr/bin/"
     "/bin"
     "$HOME/.bun/bin/"
     "$HOME/.cargo/bin/"
     "$HOME/.opencode/bin/"

     $path
)
export PATH
 path=(${path:#/nix/var/nix/profiles/default/bin})
export EDITOR=nvim
if [[ "$DESKTOP" == "1" ]]; then export VISUAL=code; else export VISUAL=nvim; fi
if [[ "$DESKTOP" == "1" ]]; then export BROWSER=firefox-devedition; else export BROWSER=firefox; fi
export GITHUB_TOKEN="$(gh auth token)"

export PAGER=less
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_INSECURE=1
export PASSWORD_STORE_DIR="$HOME/.password-store/"


fpath=(
    "$HOME/.nix-profile/share/zsh/site-functions/"
    "$ZDOTDIR/completions/"
    $fpath
    )
