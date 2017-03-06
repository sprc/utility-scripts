#!/bin/bash

gsettings reset org.gnome.desktop.interface text-scaling-factor
gsettings reset org.gnome.desktop.interface scaling-factor
gsettings reset org.gnome.settings-daemon.plugins.xsettings overrides
gsettings reset com.ubuntu.user-interface scale-factor
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-size 32
