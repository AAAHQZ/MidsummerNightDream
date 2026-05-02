# 自行下载hermes-agent（可选）
# git clone --recurse-submodules https://github.com/NousResearch/hermes-agent.git

cd hermes-agent

# https://hermes-agent.nousresearch.com/docs/getting-started/termux
python -m venv venv
source venv/bin/activate


export ANDROID_API_LEVEL="$(getprop ro.build.version.sdk)"

python -m pip install --upgrade pip setuptools wheel

python -m pip install -e '.[termux]' -c constraints-termux.txt

ln -sf "$PWD/venv/bin/hermes" "$PREFIX/bin/hermes"

