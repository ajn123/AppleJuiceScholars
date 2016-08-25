---
video_url: URL_HERE 
name: "Customize Tmux to Your needs"
premium: false
published_at: 25-08-2016
---


You can customize you tmux.conf file in your root directory to have special options that work for you.
Here is my custom tmux.conf file

```ruby
  # reloads your source file into your current sessions
  bind r source-file ~/.tmux.conf


# improve colors
set -g default-terminal 'screen-256color'

# Set prefix key to C-a instead of Ctrl-b
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix


unbind '"' # unbind horizontal split
unbind %   # unbind vertical split'"'

bind-key - split-window -v # split pane horizontally
bind-key : split-window -h # split pane vertically


# switch panes using Alt-arrow without prefix using (alt + arrow_key)
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

  
```
## Explanation 

As you can see, I use Control-a instead of Control-b since it is easier for me to do that with one hand.  I changed my split keys to - and | for simplicity in remembering which one was vertical vs horizontal.  I should also note that I made an alias for r to reload my source file so that I can updated my tmux.conf file and change have its changes update tmux instantly.  

Since switching panes is the task I do the bost I eliminated the need for a prefix key and set the pane switches to Alt+Arrow Key for ease of use.

Thanks for reading, let me know if you have any questions.







