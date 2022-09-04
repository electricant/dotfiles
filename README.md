# dotfiles

My dotfiles repository, inspired by https://www.atlassian.com/git/tutorials/dotfiles.

The `main` branch just contains the readme, the actual dotfiles are stored in
separated branches to avoid polluting the home directory with the readme.

For a quick reference I'll copy-paste here the instuctions from the link above.

## Starting from scratch

If you haven't been tracking your configurations in a Git repository before, you
can start using this technique easily with these lines:

	git init --bare $HOME/.cfg
	alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
	config config --local status.showUntrackedFiles no
	echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ \
		--work-tree=$HOME'" >> $HOME/.bashrc

**NOTE:** This repo already contains a patched .bashrc including the alias.

After you've executed the setup any file within the $HOME folder can be
versioned with normal commands, replacing git with your newly created config
alias, like:

	config status
	config add .vimrc
	config commit -m "Add vimrc"
	config add .bashrc
	config commit -m "Add bashrc"
	config push

## Install your dotfiles onto a new system

Prior to the installation make sure you have committed the alias to your
`.bashrc` or `.zsh`:

	alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


Now clone your dotfiles into a bare repository in a "dot" folder of your
`$HOME`:

	git clone --bare <git-repo-url> $HOME/.dotfiles


Checkout the actual content from the bare repository to your $HOME:

	config checkout

If the command above fails see the link above for troubleshooting instructions
or simply delete the offending files and checkout again.

Finally, set the flag showUntrackedFiles to no on this specific (local)
repository:

	config config --local status.showUntrackedFiles no

You're done, from now on you can now type config commands to add and update your
dotfiles.

## Branches

What follows is a description of the available branches:

 * `main` -> the current branch with: license, readme and gitignore
 * `dotfiles-full` -> dotfiles offering the full-fledged config with plugins and
	various bells and whistles
 * `dotfiles-lite` -> more humble dotfiles, for simpler machines
 * `dotfiles-win` -> dotfiles for Windows

