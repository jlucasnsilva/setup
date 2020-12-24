function w
    set prefix $argv[1]
    if test -z $prefix
        cd ~/workspace
    else
        cd ~/workspace/(ls ~/workspace | grep -E "^"$prefix | tac | tail -n 1)
    end

    clear
    pwd
    echo ""
    ls
    echo ""
end
