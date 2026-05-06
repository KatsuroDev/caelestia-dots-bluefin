function fish_greeting
    echo -ne '\x1b[38;5;16m'  # Set colour to primary
    echo '      __ __      __  ____  _____  '
    echo '     / //_/___ _/ /_/ __ \/ ___/  '
    echo '    / ,< / __ `/ __/ / / /\__ \   '
    echo '   / /| / /_/ / /_/ /_/ /___/ /   '
    echo '  /_/ |_\__/_/\__/\____//____/    '
    set_color normal
    fastfetch --key-padding-left 5
end
