function wallpapers
  while true
    for w in (ls $WALLPAPERS)
      feh --no-fehbg --bg-scale $WALLPAPERS/$w
      sleep 60
    end
  end
end
