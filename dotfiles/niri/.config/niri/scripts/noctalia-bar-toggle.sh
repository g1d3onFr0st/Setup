#!/usr/bin/env zsh

update_bar() {
    focused_id="$(
        niri msg --json workspaces |
            jq -r '.[] | select(.is_focused == true) | .id'
    )"

    window_count="$(
        niri msg --json windows |
            jq --argjson id "$focused_id" \
                '[.[] | select(.workspace_id == $id)] | length'
    )"

    window_size="$(
        niri msg --json focused-window |
            jq -r '.layout.window_size // [0, 0] | "\(.[0])x\(.[1])"'
    )"

    if (( window_count == 0 )) || [[ "$window_size" == "1536x960" ]]; then
        noctalia msg bar-auto-hide-set true
    else
        noctalia msg bar-auto-hide-set false
    fi
}

update_bar

niri msg --json event-stream |
    while IFS= read -r _; do
        update_bar
    done
