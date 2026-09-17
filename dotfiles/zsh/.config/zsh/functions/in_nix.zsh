in_nix(){
    if printenv PATH | rg -q '/nix/'; then
        return 0
    else
        return 1
    fi
}
