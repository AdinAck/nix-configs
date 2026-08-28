# one-time command: `ssh -o ProxyCommand="cloudflared access ssh --hostname %h" -o HostKeyAlias=my-alias user@remote.url`
# host definition in `~/.ssh/config`:
# ```
# Host remote.url
#   ProxyCommand cloudflared access ssh --hostname %h
#   HostKeyAlias my-alias
# ```

{ pkgs, ... }:
{
  home.packages = with pkgs; [ cloudflared ];
}
