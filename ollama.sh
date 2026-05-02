# 上下文设置。agent首次输入10k，至少要有16k以上才能基本可用
export OLLAMA_CONTEXT_LENGTH=32000
# 启动ollama服务
nohup ollama serve > ollama.log 2>&1 &

# 选择合适的模型
ollama pull 64500165/qwen3.5:0.8b 
#ollama pull 64500165/qwen3.5:4b 
#ollama pull carstenuhlig/omnicoder-9b:q4_k_m 

# 验证（可选）
ollama run 64500165/qwen3.5:0.8b 
#ollama run 64500165/qwen3.5:4b 
#ollama run carstenuhlig/omnicoder-9b:q4_k_m 

ollama launch hermes-agent