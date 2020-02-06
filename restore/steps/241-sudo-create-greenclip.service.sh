#!/usr/bin/env bash
cat > /usr/lib/systemd/user/greenclip.service <<EOF
[Unit]
Description=Start greenclip daemon
After=display-manager.service

[Service]
ExecStart=/usr/bin/greenclip daemon
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
EOF

systemctl --user enable greenclip.service

