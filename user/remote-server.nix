# 1. Create tunnel on cloudflare dashboard.
# 2. Add token to `/root/cloudflared-token.env` in the form of `TUNNEL_TOKEN=...`.
# 3. Maybe restart cloudflare-tunnel service?
# 4. Add "Public application" route with URL `ssh://localhost:22`.
# --- Authentication ---
# 1. In the Cloudflare Dashboard, go to Zero Trust -> Access Controls -> Applications and make a new application.
# 2. Add identity providers...
# 3. Add access policy selecting allowed emails.

({ lib, pkgs, ...}: {
  systemd.services.cloudflare-tunnel = {
    description = "Cloudflare Tunnel for SSH (Remotely Managed)";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" "systemd-resolved.service" ];

    serviceConfig = {
      # note: --no-autoupdate since this is declarative
      ExecStart = "${lib.getExe pkgs.cloudflared} tunnel --no-autoupdate run";
      EnvironmentFile = "/root/cloudflared-token.env";
      Restart = "always";
      RestartSec = "5s";

      # temp user for service
      DynamicUser = true;
      User = "cloudflared";
    };
  };

  # allow password access via SSH in PAM
  security.pam.services.sshd.unixAuth = lib.mkForce true;

  services.openssh = {
    enable = true;
    settings = {
      # forbid password authentication by default
      PasswordAuthentication = lib.mkForce false;
      KbdInteractiveAuthentication = false;
    };

    # permit standard local subnets (for local access)
    extraConfig = ''
      Match Address 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
        PasswordAuthentication yes
        KbdInteractiveAuthentication yes
    '';
  };
})
