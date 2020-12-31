function show-battery
    set target_dir /sys/class/power_supply
    set target_battery $target_dir/(ls $target_dir | grep BAT | tac | tail -n 1)
    if test -z $target_battery
       echo ⚡ 
       return
    end

    set emax (cat $target_battery/energy_full)
    set enow (cat $target_battery/energy_now)
    set estt (cat $target_battery/status)
    set epct (math 100 x $enow / $emax | cut -d '.' -f 1)

    if test $estt = "Charging"
        set icon ⚡
    else
        set icon 🔋
    end

    echo $icon" "$epct"%"
end
