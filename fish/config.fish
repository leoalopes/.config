if status is-interactive
    set -gx AUTO_TITLE_SCREENS NO

    alias t="/home/linuxbrew/.linuxbrew/bin/tmux"
    alias ta="t attach"
    alias td="t detach"

    fish_add_path /usr/bin
    fish_add_path /usr/sbin
    fish_add_path /bin
    fish_add_path /sbin
    fish_add_path /home/lalopes/.toolbox/bin
    fish_add_path /Users/lalopes/.toolbox/bin
    fish_add_path /opt/nvim/bin
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /opt/homebrew/bin
    fish_add_path /usr/local/cuda/bin

    fish_vi_key_bindings

    fish_vi_key_bindings

    starship init fish | source
    fzf --fish | source
end

