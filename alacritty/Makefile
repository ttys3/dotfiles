.PHONY: all alacritty rustup ubuntu arch fedora rhel
all: rustup alacritty

alacritty:
	# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#zsh
	test -d alacritty || git clone https://github.com/alacritty/alacritty.git
	test -d alacritty && cd alacritty && git pull origin master --tags
	cd alacritty && git checkout -f v0.8.0 && cargo build --release && \
	cp -v target/release/alacritty ~/.local/bin/ && \
	infocmp alacritty && \
	install -D extra/logo/alacritty-term.svg ~/.icons/Alacritty.svg && \
	desktop-file-install --dir=$$HOME/.local/share/applications extra/linux/Alacritty.desktop && \
	update-desktop-database ~/.local/share/applications && \
	test -d ~/.local/share/man/man1/ || mkdir -p ~/.local/share/man/man1/ && \
	gzip -c extra/alacritty.man | tee ~/.local/share/man/man1/alacritty.1.gz > /dev/null && \
	test -d $${ZDOTDIR:-~}/.zsh_functions || mkdir -p $${ZDOTDIR:-~}/.zsh_functions && \
	grep -q .zsh_functions ~/.zshrc || echo 'fpath+=$${ZDOTDIR:-~}/.zsh_functions' >> $${ZDOTDIR:-~}/.zshrc

tmux:
	test -d tmux || git clone https://github.com/tmux/tmux.git
	test -d tmux && cd tmux && git pull origin master --tags
	cd tmux && ./autogen.sh && \
	./configure && \
	make -j$(($(nproc)+4)); \
	sudo make install; \
	which tmux; \
	tmux -V

ubuntu:
	sudo apt install -y libevent-dev
	sudo apt install -y build-essential
	sudo apt-get install bison flex

rustup:
	rustup override set stable
	rustup update stable

ubuntu:
	sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

arch:
	sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb

fedora:
	sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel g++


rhel:
	sudo yum install cmake freetype-devel fontconfig-devel libxcb-devel xcb-util-devel
	sudo yum group install "Development Tools"
