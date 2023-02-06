set verbose showmode
set number
set cedit=\
set wraplen=72

map ; :
map ^C ^[
map gJ :%!prettier --parser=json --write
map gP :r!tmux show-buffer
map gS {j!}sort -ur
map gT :%!a=$(cat %);echo "$a"
map gY !'mtmux load-buffer - u
map ga :E %_test
map gc :%!prettier --parser=css --write
map gd :r!date +\%Y-\%m-\%d
map ge :E
map gg 1G
map gj :%!prettier --parser=typescript --write
map go :%!gofmt
map gp :r!xclip -o -selection clipboard
map gqip {!}fmt -72 -s -p }}{j
map gs {!}sort -u
map gt mM:%s/[[:space:]]*$//`M 
