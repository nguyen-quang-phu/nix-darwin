function zet() {
    if [ "$1" != "" ]
    then
      if [[ $(zellij ls -s| grep -x $1) ]]; then
          zellij a $1
        else
          zellij -s $1 -l $1
        fi
    else
    fi
}
