###
# modified from https://raw.githubusercontent.com/OwO-Network/DeepLX/main/install.sh
### 

install_deeplx(){
    last_version=$(curl -Ls "https://api.github.com/repos/OwO-Network/DeepLX/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    if [[ ! -n "$last_version" ]]; then
        echo -e "${red}Failed to detect DeepLX version, probably due to exceeding Github API limitations.${plain}"
        exit 1
    fi
    echo -e "DeepLX latest version: ${last_version}, Start install..."
    rm -f /tmp/deeplx
    # like https://github.com/OwO-Network/DeepLX/releases/download/v1.0.1/deeplx_linux_amd64
    curl -LZ -f -o /tmp/deeplx https://github.com/OwO-Network/DeepLX/releases/download/${last_version}/deeplx_linux_amd64
    sudo install -m 755 /tmp/deeplx /usr/local/bin/deeplx
    curl -J -LZ -Ssf -o ~/.config/systemd/user/deeplx.service https://raw.githubusercontent.com/OwO-Network/DeepLX/main/deeplx.service
    sed -i 's@ExecStart=/usr/bin/deeplx@ExecStart=/usr/local/bin/deeplx@g' ~/.config/systemd/user/deeplx.service
    # replace WorkingDirectory=/usr/bin/ to WorkingDirectory=/usr/local/bin/
    sed -i 's@WorkingDirectory=/usr/bin/@WorkingDirectory=/usr/local/bin/@g' ~/.config/systemd/user/deeplx.service
    # replace WantedBy=multi-user.target to WantedBy=default.target
    sed -i 's@WantedBy=multi-user.target@WantedBy=default.target@g' ~/.config/systemd/user/deeplx.service
    systemctl --user daemon-reload
    systemctl --user enable deeplx
    systemctl --user start deeplx
    systemctl --user status --no-pager deeplx
    echo -e "Installed successfully, listening at 0.0.0.0:1188"
}
install_deeplx