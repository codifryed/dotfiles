function osupdate
  sudo pacman -Syu
  yay -Syu
  flatpak update
end
