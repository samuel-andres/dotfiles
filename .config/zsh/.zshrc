# ~/.config/zsh/.zshrc

# XDG
export HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# OMZ Config
ZSH_THEME="sammy"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
DISABLE_LS_COLORS="false"
plugins=(zsh-autosuggestions fast-syntax-highlighting copyfile history)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Aliases
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias zshconfig="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias atyconfig="nano ~/.config/alacritty/alacritty.toml"
alias sxhkdconfig="nano ~/.config/sxhkd/sxhkdrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias pps="podman ps"
alias dc="docker compose"
alias pc="podman compose"
alias gitundo="git reset --soft HEAD^"
alias cls="clear"
alias untar=tar -xvf
alias dev="vscli open"
alias vi="nvim"
alias vim="nvim"
alias unmute="wpctl set-default pactl set-sink-mute @DEFAULT_SINK@ toggle"
alias wp-out-speaker="wpctl set-default $(pw-cli i alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink | grep -oP 'id: \K\w+')"
# alias wp-out-headset="wpctl set-default $(pw-cli i alsa_output.usb-GN_Netcom_A_S_Jabra_EVOLVE_20_A001DCB0D7460A-00.iec958-stereo | grep -oP 'id: \K\w+')"
alias podman-desktop="nohup flatpak run io.podman_desktop.PodmanDesktop > /dev/null 2>&1 &"
alias podman-reg-cfg="sudo nano /etc/containers/registries.conf"
alias podman-api-cfg="sudo nano /usr/lib/systemd/user/podman.service"
alias podman-api-watch="journalctl --user --follow -u podman.service"
alias podman-top='for container_id in $(podman ps -q); do
    container_name=$(podman inspect --format="{{.Name}}" $container_id)
    container_name=${container_name#\/}
    echo "Container Name: $container_name"
    podman top $container_id -eo pid,user,%cpu,%mem,vsz,rss,tty,stat,start,time,command
    echo "----------------------------------------"
done'

# faster than neofetch btw
fastfetch
