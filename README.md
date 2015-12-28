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

------------------------

### Scripts
included in bin/

#### texinit

Initialize report writing environment
[code](https://github.com/nobuyo/dotfiles/blob/master/bin/texinit)

Usage:
~~~ bash
$ texinit (newdir) #=> create working directory
$ cd (newdir)
$ make init #=> create tex sources
~~~

#### javalipse

rebuild Java project for eclipse
[code](https://github.com/nobuyo/dotfiles/blob/master/bin/javalipse)

Usage:
~~~ bash
$ javalipse (directory name)
~~~

####tenki

get weather forecast from weather.livedoor.com
[code](https://github.com/nobuyo/dotfiles/blob/master/bin/tenki)

Usage:
~~~ bash
$ tenki <OPTION> <AREA>
~~~