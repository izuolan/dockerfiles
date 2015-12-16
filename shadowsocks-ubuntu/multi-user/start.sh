echo "========================================================================"
echo " You can now connect to this ShadowSocks server:"
cat /etc/shadowsocks.json
echo " Please remember the password!"
echo "========================================================================"

ssserver -c /etc/shadowsocks.json
