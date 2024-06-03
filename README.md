# myemacs-init.el
my emacs setting


```bash

ln -s /tmp /tmp/host
DIR=~/emacs.d
DISPLAY=:0
docker run -d --name emacs \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /tmp/.XIM-unix:/tmp/.XIM-unix \
       -v /home:/home \
       -v /tmp:/tmp/host \
       -e HOME=$HOME \
       -e DISPLAY=$DISPLAY \
       -e GTK_IM_MODULE=$GTK_IM_MODULE \
       -e QT_IM_MODULE=$QT_IM_MODULE \
       -e XMODIFIERS=$XMODIFIERS \
       -v /etc/passwd:/etc/passwd:ro \
       -v /etc/group:/etc/group:ro   \
       -v /etc/shadow:/etc/shadow:ro   \
       --network=host \
       --user $(id -u):$(id -g) \
       local/emacs29 emacs --init-directory=$DIR

```
