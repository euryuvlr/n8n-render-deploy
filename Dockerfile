# Usa a imagem oficial do n8n (baseada em Alpine Linux)
FROM n8nio/n8n:latest

# Muda para root para instalar dependências
USER root

# Instala Python, pip e ferramentas necessárias usando apk (Alpine)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

# Instala pacotes Python que seu script precisa
RUN pip3 install --no-cache-dir pandas openpyxl requests

# Cria diretório para dados (opcional, sem persistência no free tier)
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Volta para o usuário node (não-root)
USER node

# Expõe a porta do n8n
EXPOSE 5678