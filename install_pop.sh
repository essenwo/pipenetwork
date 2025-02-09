#!/bin/bash

# 提示用户输入 Solana 地址
read -p "请输入您的 Solana 地址: " SOLANA_PUBKEY

# 确保用户输入了 Solana 地址
if [[ -z "$SOLANA_PUBKEY" ]]; then
    echo "错误：Solana 地址不能为空！"
    exit 1
fi

# 下载 pop
wget https://dl.pipecdn.app/v0.2.4/pop -O pop

# 赋予执行权限
chmod +x pop

# 创建所需目录
mkdir -p download_cache /data

# 使用 screen 后台运行 pop
screen -dmS pop ./pop --ram 6G --max-disk 300G --cache-dir /data --pubKey "$SOLANA_PUBKEY"

echo "安装完成，pop 已在后台运行。可以使用 'screen -r pop' 查看日志。"
