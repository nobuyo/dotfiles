# dotfiles

### Installation

Please run following command your terminal:

~~~
bash -c "$(curl -fsSL dot.medy.xyz)"
~~~

**OR**

~~~
$ git clone https://github.com/nobuyo/dotfiles
$ mv dotfiles/ .dotfiles/
$ cd .dotfiles/
$ make deploy
~~~

========================================-

### scripts
included in bin/

#### texinit

Initialize report writing environment

Usage:
~~~
texinit (newdir) #=> create working directory
cd (newdir)
make init #=> create tex sources
~~~

#### javalipse

rebuild Java project for eclipse

Usage:
~~~
javalipse (directory name)
~~~