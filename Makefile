IGNORE := .DS_Store .git .gitmodules .gitignore
TARGET := $(wildcard .??*) bin
FILES  := $(filter-out $(IGNORE), $(TARGET))

.PHONY: compinit deploy update

compinit:
	@$(RM) ~/.zcompdump
	@compinit
	@mv ~/.zcompdump .zcompdump

deploy:
	@$(foreach val, $(FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull origin master

sshdecrypt:
	openssl aes-256-cbc -d -in ~/.dotfiles/sshconfig -out ~/.ssh/config

# init:
# 	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)