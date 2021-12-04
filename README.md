
# NeoVimの設定ファイル

## 前提環境

- windowsのwsl(ubuntu20.04)

## ディレクトリ構造
<pre>
~/.cache
	|
	dein/
	└── repos
	    └── github.com
	        ├── Shougo
	        ├── Yggdroot
	        ├── dense-analysis
	        ├── elzr
	        ├── jiangmiao
	        ├── mattn
	        ├── maxmellon
	        ├── nathanaelkane
	        ├── neoclide
	        ├── nvie
	        ├── psf
	        ├── roxma
	        ├── ryanoasis
	        ├── scrooloose
	        ├── thinca
	        ├── tpope
	        ├── turbio
	        ├── vim-airline
	        └── yuezk
</pre>

<pre>
~/.config
	|
	nvim/
	├── README.md
	├── coc-settings.json
	├── colors
	│   ├── lucius.vim
	│   └── molokai.vim
	├── init.vim
	└── userconfig
	    ├── plugin.toml
	    ├── plugin_lazy.toml
	    └── plugins
	        ├── caw.rc.vim
	        ├── coc.rc.vim
	        ├── emmet.rc.vim
	        ├── fugitive.rc.vim
	        └── quickrun.rc.vim
</pre>

## 設定手順

1. neovimをインストール(python3環境構築)


sudo apt-add-repository ppa:neovim-ppa/stable

sudo apt update

sudo apt -y install neovim

sudo apt -y install python-dev python-pip python3-dev python3-pip

python3 -m pip install --upgrade pip

pip install pynvim

pip install flake8

pip install black

pip install mypy

pip install isort



2. dein.vimをインストール
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

" For example, we just use `~/.cache/dein` as installation directory

sh ./installer.sh ~/.cache/dein

3. 最新のnodejsをインストール
sudo apt install -y nodejs npm

sudo npm install n -g

sudo n stable

sudo apt purge -y nodejs npm

exec $SHELL -l

node -v

4. coc.nvimにlsp追加
nvimを開いた状態で

:CocInstall coc-python, coc-tsserver, coc-json

5. pythonコマンドでpython3を使えるようにシンボリックリンクを設定

これしないとquickrunが動きません

ln -s /usr/bin/python3 /usr/bin/python
N
