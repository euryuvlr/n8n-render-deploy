# Usa a imagem oficial do n8n com Python
FROM n8nio/n8n:latest

# Muda para root para instalar dependências
USER root

# Instala Python, pip e ferramentas necessárias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Instala pacotes Python que seu script precisa
RUN pip3 install pandas openpyxl requests

# Cria diretório para dados persistentes
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Volta para o usuário node (não-root)
USER node

# Expõe a porta do n8n
EXPOSE 5678