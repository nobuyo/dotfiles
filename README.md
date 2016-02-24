# dotfiles

## Installation

Please run following command your terminal:

~~~
bash -c "$(curl -fsSL dot.medy.xyz)"
~~~

**OR**

~~~
$ git clone https://github.com/nobuyo/dotfiles ~/.dotfiles
$ cd ~/.dotfiles/
$ make deploy
~~~

## Scripts
included in bin/

#### texenv

Initialize report writing environment

[code](https://github.com/nobuyo/dotfiles/blob/master/bin/texinit)

Usage:
~~~ bash
$ texinit (newdir) #=> create working directory
$ cd (newdir)
$ make init #=> create tex sources
~~~

You can use a option -i to automatically run `make init`.
~~~bash
$ texinit -i (newdir) #=> create working directory and initialize
~~~

#### javalipse

rebuild Java project for eclipse

[code](https://github.com/nobuyo/dotfiles/blob/master/bin/javalipse)

Usage:
~~~ bash
$ javalipse (directory name)
~~~

#### tenki

get weather forecast from weather.livedoor.com

[code](https://github.com/nobuyo/dotfiles/blob/master/bin/tenki)

Usage:
~~~ bash
$ tenki [<OPTION>] [<AREA>]
~~~

Supported area:
- kushiro
- sapporo
- sendai
- akita
- tokyo
- saitama
- yokohama
- kanazawa
- nagano
- nagoya
- osaka
- hiroshima
- kochi
- fukuoka
- okinawa
and you can add more areas

#### gitch

ssh/https switcher on git repogitory

[code](https://github.com/nobuyo/dotfiles/blob/master/bin/gitch)

Usage(on git directory):
~~~bash
$ gitch
~~~

#### chcolor

prompt switcher by sourcing dotfiles (.zshrc_XXX)

[code](https://github.com/nobuyo/dotfiles/blob/master/bin/chcolor)


Require:
* An environmental variable `PROMPT_COLOR_SWITCH` is exported
* your dotfiles available

Usage:
~~~bash
$ chcolor
~~~
