#!/usr/bin/env bash
#
# Yamada Hayao
# Twitter: @Hayao0819
# Email  : hayao@fascode.net
#
# (c) 2019-2021 Fascode Network.
#

# disable light-locker on live
sed -i "/light/s/^/# /g" /home/${username}/.config/bspwm/bspwmrc

# disable auto screen lock
rm /etc/xdg/autostart/light-locker.desktop

# Update system datebase
dconf update

# ntp
systemctl enable systemd-timesyncd.service

# Enable LightDM to auto login
if [[ "${boot_splash}" =  true ]]; then
    systemctl enable lightdm-plymouth.service
else
    systemctl enable lightdm.service
fi

# Replace auto login user
sed -i "s|%USERNAME%|${username}|g" "/etc/lightdm/lightdm.conf.d/02-autologin.conf"
