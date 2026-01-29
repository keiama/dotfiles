# dotfiles
## Ubuntu-24.04 on WSL
```
sudo apt update && sudo apt upgrade -y
```

```
git config --global user.name keiama \
&& git config --global user.email keiama@users.noreply.github.com \
&& git config --global init.defaultBranch main
```

```
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
gh auth login
```

```
git clone git@github.com:keiama/dotfiles.git
bash ~/dotfiles/setup.sh
```

再ログイン後、nvimで以下を実行。
:Mason
:MasonInstallAll
:MasonInstall rust-analyzer
:MasonInstall codelldb

