function wallpapers
  while true
    for w in (ls $WALLPAPERS)
      feh --no-fehbg --bg-scale $WALLPAPERS/$w
      sleep 540
    end
  end
end
