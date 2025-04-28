{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.i3lock-color = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		cp ${./i3lock-color} ${home}/.config/i3lock-color
		chown ${username}:${group} ${home}/.config/i3lock-color
		chmod 700 ${home}/.config/i3lock-color
	'';

	environment.systemPackages = with pkgs; [
		i3lock-color
	];
}
