{ pkgs, ... } : {
	environment.systemPackages = with pkgs; [
		# Languages
		rustup
		# Editors
		vscode
		vim
		# Misc
		gh
		asdf
	];
}
