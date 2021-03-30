install:
	-systemctl --user stop mytmux 2>/dev/null
	install -vD -m 755 ./mytmux.service ~/.config/systemd/user/mytmux.service
	systemctl --user daemon-reload
	systemctl --user enable --now mytmux
	systemctl --user status mytmux
	journalctl --user -a -f -u mytmux
.PHONY: install

mystart:
	install -vD -m 755 ./mystart.service ~/.config/systemd/user/mystart.service
	systemctl --user daemon-reload
	systemctl --user enable --now mystart
	-systemctl --user status mystart
.PHONY: mystart
