function e
    set prefix $argv[1]
    if test -z $prefix
        echo "error: invalid prefix"
        return
    end

    set project (ls ~/workspace | grep -E "^"$prefix | tac | tail -n 1)
    if test -z $project
        echo "error: project not found for this prefix"
        return
    end

    cd ~/workspace/$project
    nvim -s ~/.config/nvim/open-with-fzf.vim
end
