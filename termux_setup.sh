# 使用 阿里云 termux源（可替换）
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.aliyun.com/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
pkg upgrade

# 使用 阿里云 cargo源（可替换）
mkdir -p ~/.cargo
touch ~/.cargo/config.toml
cat << 'EOF' > ~/.cargo/config.toml
[source.crates-io]
replace-with = "aliyun"

[source.aliyun]
registry = "sparse+https://mirrors.aliyun.com/crates.io-index/"
EOF

# 使用 华为云 pip源（可替换）
pip config set global.index-url https://mirrors.huaweicloud.com/repository/pypi/simple

# 安装必要依赖
pkg install -y git python clang rust make pkg-config libffi openssl nodejs ripgrep ffmpeg

# 安装可选依赖
# pkg install sshd ollama

# 设置服务自启动脚本
cp ./service.sh $PREFIX/etc/service.sh
cat > ~/.cargo/config.toml << 'EOF'
if pgrep -x "nohup $PREFIX/etc/service.sh > ~/service.log 2>&1 &" >/dev/null
then
    echo "服务运行中..."
else
    nohup $PREFIX/etc/service.sh > ~/service.log 2>&1 &
    echo "服务已开启..."
fi
EOF
echo 'nohup $PREFIX/etc/service.sh > ~/service.log 2>&1 &' >> $PREFIX/etc/termux-login.sh
