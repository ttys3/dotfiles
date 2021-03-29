install:
	-systemctl --user stop tmux 2>/dev/null
	install -vD ./tmux.service ~/.config/systemd/user/tmux.service
	systemctl --user daemon-reload
	systemctl --user enable --now tmux
	systemctl --user status tmux
	journalctl --user -a -f -u tmux
.PHONY: install
