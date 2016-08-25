---
video_url: URL_HERE 
name: "Intro to Tmux"
premium: false
published_at: 24-08-2016
---

### For instruction on how to install Tmux see [here](https://www.sitepoint.com/tmux-a-simple-start/)

Tmux allows you to navigate and switch panes with ease.  Here are some of the most powerful and useful commands to get you started:

```ruby
tmux # start a tmux session

tmux new -s session_name # starts a new session with the name session_name

tmux attach -t session_name # attach to a previous detach session

tmux ls # list all you detached sessions

```

## Commands in Tmux
Once you have entered Tmux, you now have the ability to make panes.  You do so with the leading key, with by defaul is Control B (Ctrl-B, know as C-b below)

```ruby
C-b " # split the pane vertically

C-b % # split the pan horizontally

C-b (Arrow Key) # Move from pane to pane

C-b x # delete a pane

C-b d # exit tmux

C-b $ #rename your session

C-b z #zoom in one pane, press again to zoom out

C-b ? # display a list of all tmux commands, press q to quit

C-b c # create a new window

C-b n # cycle through windows

C-b [0-9] #Go to the designated window

