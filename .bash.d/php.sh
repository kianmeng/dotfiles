# Bash settings for PHP.
export COMPOSER_VENDOR_BIN=$HOME/.composer/vendor/bin

if [[ ! -d $COMPOSER_VENDOR_BIN ]]; then
    mkdir -p $COMPOSER_VENDOR_BIN
fi

if [[ ! "$PATH" =~ "$COMPOSER_VENDOR_BIN" ]]; then
    export PATH=$PATH:$COMPOSER_VENDOR_BIN
fi

