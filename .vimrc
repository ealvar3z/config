set hidden
map ; :
inoremap jk <Esc>

map gP :r!tmux show-buffer
map gS {j!}sort -ur
map gT :%!a=$(cat %);echo "$a"
map gY !'mtmux load-buffer - u
map ga :E %_test
map ge :E
map gg 1G
map go :%!gofmt
map gp :r!xclip -o -selection clipboard
map gqip {!}fmt -72 -s -p }}{j
map gs {!}sort -u
map rd :r!date +\%Y-\%m-\%d
map ws :%s/[[:space:]]*$//
