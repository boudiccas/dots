This is the documentation for 'beeb' [version 3.0] the all-singing, all-dancing,
upgrade to 'get-iplayer'!

The BBC has some superb radio and TV programmes, some of which can be downloaded
using 'get-iplayer', and then can be played with your choice of viewer. This
script will -

	* Check to see if you have 'get-iplayer/get_iplayer' installed. If not it
	will prompt you to install it.
	* Creates the directory where the 'beeb-tv.txt & beeb-radio.txt' files are
      stored.
	* Downloads the current radio programme feed,
	* Allows you to put the programme numbers in to download, and tell you how much more
	you can download in this session,
	* Downloads the programmes and saves as *.mp3,
	* Asks you if you want to create a playing list of the radio programmes that can
	then be used by MPD.
	* Then downloads the current TV programme feed,
	* Allows you to put the programme numbers in to download, and tell you how much more
	you can download in this session,
	* Downloads the programmes.

But before any of this can happen you need to configure it all, and this is done
using '.beebrc' which should be saved to your "/home/$USER" directory. In
'.beebrc' you can see the paths to my various directories, which will give
you an idea of what should go where in your setup. So if you open '.beebrc' in
your favourite text editor, then change these lines -

tvsite="where the downloaded tv programmes are to be stored"
music="where your main music library is stored"
radiosite="where the downloaded radio programmes are to be stored"
beebradio="the playlist of your downloaded radio programmes"

Then to run 'beeb' from the terminal, you need to place it somewhere in your
executable pathway, maybe '/home/$USER/bin/' or '/usr/local/bin' and then just
put 'beeb' in your terminal and follow the questions that it gives you.

* Required.
get-iplayer.
The prime requirement of this script is the programme 'get-iplayer' which is in most
linux distributions. Without it, the script will not function!

* Hints.
 - There is no need to press ENTER to proceed, just answer "y, n or q". The only
 time you need to press ENTER is when you are inputting programme numbers.
 - The programme listings for both radio and tv will be found at
   "/home/$USER/.beeb/"
 - Don't let ~/.get_iplayer/download_history get too big as it will cause
 problems in your downloading, like being very slow, or causing the programme to
 drop the connection.
 - If the programme appears to hang, it may be trying to reconnect, or have just
 crashed, in which case, you will have to run 'beeb' again with the same input
 as you used before.
 - If you do need to break out of 'beeb', for whatever reason, you can either
 answer 'q' when you're prompted for it, or just press 'CONTROL C' to crash
 out.
 - To access ~/.beeb to read 'beeb-radio.txt' or 'beeb-tv.txt' just enter 'cd
 $HOME/beeb' which auto-opens it at the prompt. Then you can use '$EDITOR
 beeb-radio.txt' or '$EDITOR beeb-tv.txt' to display either of the
 files. $EDITOR is your choice of text editor.
 - You will find that the script silently creates a file called 'touch.m4a'
 which is needed when creating the MPD playlist. This file has zero content and
 poses no threat to you or your computer, and should be left in place. If you
 do delete it, then the script will crash whilst creating the MPD playlist, so
 please leave it in place as it is needed.

* The legalities.
Please note, I am not a lawyer, and this section is created using internet
sources.

'get-iplayer' is only supposed to be used in the UK, if you do manage to use it
outside the UK, then good luck to you but you will be unable to get any
support for it. And to use it in the UK you should also have a UK TV licence
too. Any files downloaded with 'get-iplayer', or this script, should only be kept
for 30 days before being deleted.

Any problems, or further instruction required, please let me know at 'boudiccas@talktalk.net'.

Sharon Kimble.
February 2014.
