# Function to quickly create an application icon from 1024px master file.

function mkicns() {
    if [[ -z "$@" ]]; then
        echo "Input file missing"
    else
        filename=${1%.*}
        mkdir $filename.iconset
        sips -z 16 16   $1 --out $filename.iconset/icon_16x16.png
        sips -z 32 32   $1 --out $filename.iconset/icon_16x16@2x.png
        sips -z 32 32   $1 --out $filename.iconset/icon_32x32.png
        sips -z 64 64   $1 --out $filename.iconset/icon_32x32@2x.png
        sips -z 128 128 $1 --out $filename.iconset/icon_128x128.png
        sips -z 256 256 $1 --out $filename.iconset/icon_128x128@2x.png
        sips -z 256 256 $1 --out $filename.iconset/icon_256x256.png
        sips -z 512 512 $1 --out $filename.iconset/icon_256x256@2x.png
        sips -z 512 512 $1 --out $filename.iconset/icon_512x512.png
        cp $1 $filename.iconset/icon_512x512@2x.png
        iconutil -c icns $filename.iconset
        rm -r $filename.iconset
    fi
}
# This function will use AppleScript to present a password entry dialog to make your scripts a little more user friendly.
function gui_password {
    if [[ -z $1 ]]; then
        gui_prompt="Password:"
    else
        gui_prompt="$1"
    fi
    PW=$(osascript <<EOF
    tell application "System Events"
        activate
        text returned of (display dialog "${gui_prompt}" default answer "" with hidden answer)
    end tell
EOF
    )

    echo -n "${PW}"
}

# Get Path of Frontmost Finder Window
function finder_path {
    osascript -e 'tell application "Finder"'\
        -e "if (${1-1} <= (count Finder windows)) then"\
        -e "get POSIX path of (target of window ${1-1} as alias)"\
        -e 'else' \
        -e 'get POSIX path of (desktop as alias)'\
        -e 'end if' \
        -e 'end tell';
}

# Print Files Selected in Finder
function selected {
    osascript <<EOT
        tell application "Finder"
            set theFiles to selection
            set theList to ""
            repeat with aFile in theFiles
                set theList to theList & POSIX path of (aFile as alias) & "\n"
            end repeat
            theList
        end tell
EOT
}

# Set Current Directory's Finder View to Column View

function column_view {
    osascript -e 'set cwd to do shell script "pwd"'\
      -e 'tell application "Finder"'\
      -e "if (${1-1} <= (count Finder windows)) then"\
      -e "set the target of window ${1-1} to (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to column view"\
      -e 'else' -e "open (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to column view"\
      -e 'end if' -e 'end tell';
}

# Set Current Directory's Finder View to Icon View

function icon_view {
    osascript -e 'set cwd to do shell script "pwd"'\
      -e 'tell application "Finder"'\
      -e "if (${1-1} <= (count Finder windows)) then"\
      -e "set the target of window ${1-1} to (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to icon view"\
      -e 'else' -e "open (POSIX file cwd) as string"\
      -e "set the current view of the front Finder window to icon view"\
      -e 'end if' -e 'end tell';
};

# Set Current Directory's Finder View to List View

function list_view {
  osascript -e 'set cwd to do shell script "pwd"'\
    -e 'tell application "Finder"'\
    -e "if (${1-1} <= (count Finder windows)) then"\
    -e "set the target of window ${1-1} to (POSIX file cwd) as string"\
    -e "set the current view of the front Finder window to list view"\
    -e 'else' -e "open (POSIX file cwd) as string"\
    -e "set the current view of the front Finder window to list view"\
    -e 'end if' -e 'end tell';\
}
