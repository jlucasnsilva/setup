function w
    cd ~/workspace/(ls ~/workspace | grep -E "^"$argv[1] | tac | tail -n 1)
    clear
    pwd
    echo ""
    ls
    echo ""
end
