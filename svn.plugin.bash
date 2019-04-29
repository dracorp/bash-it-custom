alias svn-ignore='svn propedit svn:ignore .'
alias svn-keywords='svn propset svn:keywords "Date Id Revision"'
SVN_EDITOR='\
    vim -c "4,\$y" \
    -c "below new" \
    -c "put" \
    -c "set syntax=diff buftype=nofile nowrap nobackup previewwindow bufhidden=delete" \
    -c "silent execute \"%!cut -c-5 --complement | xargs svn diff --no-diff-deleted -x --ignore-eol-style\" | redraw" \
    -c "wincmd k" +0'
# change "below now" with vnew for a vertical split
#SVN_EDITOR='vim -c "4,\$!cut -c-5 --complement | xargs svn diff --no-diff-deleted -x --ignore-eol-style" -c "set syntax=diff" +0'
SVN_EDITOR=vim
export SVN_EDITOR
