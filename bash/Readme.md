My various bash scripts that I've written or amended.

* 'backup'-v5.6 = my homegrown rsync backup file dated October 2013.
* 'reinstall'-v1.0 = a reinstall script to help doing a restore.
* 'reinstall-ubuntu'-v1.5 = the reinstall script amended to be used with ubuntu,
  not tested by me.
* 'show'-v2.0 = a script to see a description of a file, whether its installed
  or not, and what repo its in.
* 'want'-v1.0 = a script to search the apt-cache, show you one chosen programme,
  gives you the option of installing it, and then gives you the option of
  updating the universal database.
* 'fluxwant'-v2.0 = the same as 'want' but also creates a fluxbox menu. NB -
  Requirement of 'menumaker-0.99.7.tar.gz' which is in the **programmes**
  folder.
* 'mengen'-v2.0 = a stand-alone fluxbox menu generator, that auto-includes your
  'usermenu' and deletes all the xscreensaver entries in "Other". NB -
  Requirement of 'menumaker-0.99.7.tar.gz' which is in the **programmes**
  folder.
* 'fluxmenu'-v4.0 = a complete script to install programmes, and then generate a
  new menu complete with your usermenu and no mention of xscreensavers. NB -
  Requirement of 'menumaker-0.99.7.tar.gz' which is in the **programmes**
  folder.
* 'radiostreams'-v2.0 = a script to generate new radio stations in your MPD playlists.

To use these scripts, download the one/s you want to use, and save them to
'/home/$USER/bin/' and make the $PATH executable. To do this, put

    PATH=$PATH:~/bin;
    export PATH

in your '.bashrc' file, and then restart your terminal, and the files can now be
used as commands at the command-line. If you get a 'Permission denied' error, it
probably means that you haven't made the file executable, which can be done by
running 'chmod +x /PathToNewFile' and ENTER. Then try again and it should work.



Sharon Kimble.
February 2014.
