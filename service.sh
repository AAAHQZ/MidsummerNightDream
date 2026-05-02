# termux
termux-wake-lock &
# sshd
sshd &
# hermes gateway
nohup hermes gateway run >~/.hermes/logs/gateway.log 2>&1 &