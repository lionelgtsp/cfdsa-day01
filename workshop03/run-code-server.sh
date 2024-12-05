docker run -d \
--name=code-server \
-e TZ=Asia/Singapore \
-e PASSWORD=password \
-e SUDO_PASSWORD=password \
-e DEFAULT_WORKSPACE=/config/workspace \
-p 8443:8443 \
-e PROXY_DOMAIN=code-<IP>.nip.io \
-v workspace-vol:/config/workspace \
linuxserver/code-server:amd64-13.10.24