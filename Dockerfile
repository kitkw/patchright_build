# 使用 Python 3.10.15 slim 镜像作为基础镜像
FROM python:3.10.15-slim-bookworm

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt
COPY requirements.txt .

# 安装系统依赖和 Python 包
RUN apt-get update && apt-get install -y \
    iproute2 \
    procps \
    cron \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    locales \
    && pip install --no-cache-dir -r requirements.txt \
    && patchright install chromium \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

