" Script for getting all Internet Archive snapshots for a given page and year.
" Maintainer: Issa Rice <riceissa@gmail.com>
" Last Change: 2018 Jun 20
" License: CC0
"
" This Vimscript takes the output of Firefox's 'View Selection Source' and
" returns the list of snapshot links.  As an example, take the following page:
" https://web.archive.org/web/20140101000000*/http://givewell.org/about/people
" Select everything from the 'JAN' of the January calendar to the '31' of the
" December calendar.  Now right click and select 'View Selection Source'.  A
" new tab will open with one extremely long line.  Copy this text into a new
" Vim buffer, then source this script with
"     :source get_internet_archive_snapshots.vim
" Now the buffer should be filled with links to all the snapshots for that
" year, one per line.

" Put each tag on a separate line
%s/></>\r</g

" Keep only lines with a link
vg/http:/d

" Strip everything except the link on each line
%s/^[^"]\+"\([^"]\+\)"[^"]\+$/\1/

" Convert to full link
%s+^+https://web.archive.org+
