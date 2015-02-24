function makebin --description 'in ~/.config/fish/functions'
	touch $HOME/bin/$argv[1]
  chmod +x $HOME/bin/$argv[1]
  vim $HOME/bin/$argv[1]
end
