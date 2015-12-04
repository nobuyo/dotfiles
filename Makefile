IGNORE := .DS_Store .git .gitmodules .travis.yml
TARGET   := $(wildcard .??*) bin
FILES    := $(filter-out $(IGNORE), $(TARGET))

.PHONY: mv deploy update

mv:
	@mv dotfiles/ .dotfiles/

deploy:
	@$(foreach val, $(FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull origin master

# init:
# 	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)