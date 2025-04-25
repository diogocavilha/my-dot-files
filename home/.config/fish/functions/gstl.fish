function gstl --wraps=git\ stash\ list\ --color=always\ --format=\'\%gd:\ \%C\(bold\)\ \%\>\(14\)\%Cgreen\%cr\ \%C\(red\)\%gs\' --description alias\ gstl=git\ stash\ list\ --color=always\ --format=\'\%gd:\ \%C\(bold\)\ \%\>\(14\)\%Cgreen\%cr\ \%C\(red\)\%gs\'
  git stash list --color=always --format='%gd: %C(bold) %>(14)%Cgreen%cr %C(red)%gs' $argv
        
end
