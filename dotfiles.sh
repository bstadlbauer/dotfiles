#!/bin/bash

DOTFILES_DIR=$(dirname $(greadlink -f $0))/files
DEST_DIR=$HOME

echo $DOTFILES_DIR

function isSamePath() {
  [[ "$(greadlink -f $1)" == "$(greadlink -f $2)" ]];
}

function install_links() {
  pushd $DOTFILES_DIR > /dev/null
  for FILE in $(find *); do
    SRC=${DOTFILES_DIR}/$FILE
    DEST=${DEST_DIR}/.$FILE

    if [[ -f $SRC ]]; then
      # if parent directory for destination does not exist
      if [[ ! -d $(dirname $DEST) ]]; then
        # link the whole directory instead of a single file
        echo "Linking $(dirname $DEST)"
        ln -s $(dirname $SRC) $(dirname $DEST)
      else
        # if target directory is a link, check if we already linked it
        SRC_PARENT_DIR=$(dirname $SRC)
        DEST_PARENT_DIR=$(dirname $DEST)
        if ! isSamePath "$DEST_PARENT_DIR" "$SRC_PARENT_DIR"; then
          # If $DEST already exists and is not a link to our file, print a warning
          if [[ -f $DEST ]] && ! isSamePath "$DEST" "$SRC"; then
            echo "File $DEST exists, won't link!"
          else
            if [[ ! -f $DEST ]]; then
              echo "Linking $DEST"
              ln -s $SRC $DEST
            fi
          fi
        fi
      fi
    elif [[ -d $SRC ]] && [[ ! -d $DEST ]]; then
      echo "Linking $DEST"
      ln -s $SRC $DEST
    fi
  done
  popd > /dev/null
}

function uninstall_links() {
  pushd $DOTFILES_DIR > /dev/null
  for FILE in $(find *); do
    SRC=${DOTFILES_DIR}/$FILE
    DEST=${DEST_DIR}/.$FILE

    if [[ -h $DEST ]]; then
      if isSamePath $DEST $SRC; then
        echo "Unlinking $DEST"
        rm $DEST
      fi
    fi
  done
  popd > /dev/null
}



case "$1" in
  -i)
      echo "Installing links ..."
      install_links
      ;;
  -u)
      echo "Uninstalling links ..."
      uninstall_links
      ;;
  *)
      echo "Usage: $(basename $0) COMMAND"
      echo "Commands:"
      echo "  -i Install links"
      echo "  -u Uninstall links"
      exit 1
esac

