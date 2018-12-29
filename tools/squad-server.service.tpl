[Unit]
Description=Squad Server NAME
After=network-online.target
 
[Service]
Type=simple
 
User=USER
Group=USER

ExecStartPre=/bin/bash /path/to/steamcmd.sh +login anonymous +force_install_dir path/to/server +app_update 403240 validate +quit
ExecStartPre=/usr/bin/git -C "/path/to/server/config" pull
ExecStart=/bin/bash path/to/server/SquadServer.sh Port=7787 QueryPort=27165 RCONPASSWORD=CHANGEME
 
Restart=on-failure
 
[Install]
WantedBy=multi-user.target