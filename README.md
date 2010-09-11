about
-----
A collection of configuration files for the typical console programs bash, vim,
screen, and misc. 

why?
----
* Save time. Same programs settings can be applied to every GNU/Linux machines.
* Less painful transition. Especially for a WAMP developer to a LAMP developer.

use it
------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. Three methods to use
these dot files in your own home account. 

* Method 1 (manually)
  1. cd
  2. git clone http://github.com/kenmin/dotfiles.git
  3. cd dotfiles
  4. mv * .[A-Za-z0-9]* ../
  5. cd
  6. rmdir dotfiles
  7. git pull

* Method 2 (as answered by Russell Steicke on [how to clone into an existing directory](http://marc.info/?l=git&m=123476954726055&w=2))
  1. cd
  2. git init
  3. git remote add origin http://github.com/kenmin/dotfiles.git
  4. git fetch
  5. git branch master origin/master
  6. git checkout master
  7. git pull

* Method 3 (cherry picking)

  Read the dotfile online and cut and paste the portion you find useful.
