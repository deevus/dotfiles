#!/bin/bash
cd $HOME/.password-store
PASSFILE=$(tree -Ffi | grep '.gpg' | sed 's/.gpg$//g' | sed 's/^..//' | fzf)

if [ -z "$PASSFILE" ]; then
    exit 0
fi

RESP=$(cat <<EOF | fzf
Autotype
Username
Password
OTP
URL
EOF
);

swaymsg move container to workspace 9

case "$RESP" in
    Autotype)
        # type username
        ydotool type "$(pass $PASSFILE | grep login: | cut -d' ' -f2-)"
        # press tab
        ydotool key Tab
        # type password
        ydotool type "$(pass $PASSFILE | head -n 1)"
        # press enter
        ydotool key Enter
        ;;
    Username)
        ydotool type "$(pass $PASSFILE | grep login: | cut -d' ' -f2-)"
        ;;
    Password)
        # type password
        ydotool type "$(pass $PASSFILE | head -n 1)"
        ;;
    OTP)
        # type OTP
        ydotool type "$(pass otp $PASSFILE)"
        ;;
    URL)
        # type url
        ydotool type "$(pass $PASSFILE | grep url: | cut -d' ' -f2-)"
        ;;
    *)
        exit 1
esac
