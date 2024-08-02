if status is-interactive
    set -gx AUTO_TITLE_SCREENS NO

    set -gx NVM_DIR (brew --prefix nvm)

    alias t="/home/linuxbrew/.linuxbrew/bin/tmux"
    alias ta="t attach"
    alias td="t detach"

    fish_add_path /usr/bin
    fish_add_path /usr/sbin
    fish_add_path /bin
    fish_add_path /sbin
    fish_add_path /home/lalopes/.toolbox/bin
    fish_add_path /opt/nvim/bin
    fish_add_path /home/linuxbrew/.linuxbrew/bin

    ~/.local/bin/mise activate fish | source
    starship init fish | source
    fzf --fish | source
end

t new-session -A -s main
