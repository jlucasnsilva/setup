function show-volume
    if test -n (amixer get Master | grep '\[on\]')
        amixer get Master | grep -E '\\[[0-9]*%\\]' | grep -oE '[0-9]*%'
    else
        echo '∅ '
    end
end
