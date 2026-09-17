gitclone(){
    local script=$(bun run "$ZDOTDIR/functions/gitclone/gitclone.ts" "$@") 
    zsh -c "$script"
}

