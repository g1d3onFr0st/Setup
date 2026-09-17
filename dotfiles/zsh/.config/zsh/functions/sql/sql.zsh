sql(){
    local script="$(bun run $ZDOTDIR/functions/sql/sql.ts)"
    eval "$script"
}
