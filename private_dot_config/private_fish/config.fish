if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/ravenna/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Load all ssh keys that start with "id_ed25519"
function loadsshkeys
  set added_keys (ssh-add -l)
   for key in (find ~/.ssh/ -not -name "*.pub" -a -iname "id_ed25519*")
    if test ! (echo $added_keys | grep -o -e $key)
      ssh-add -q "$key"
    end
  end
end

# Call the function to run it.
loadsshkeys