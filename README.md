# nixos-i3lock-color
nixos-i3lock-color = fetchGit {
	url = "https://github.com/typovrak/nixos-i3lock-color.git";
	ref = "main";
};

(import "${nixos-i3lock-color}/configuration.nix")
