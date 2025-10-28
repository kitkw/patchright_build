# 使用 Python 3.10.15 slim 镜像作为基础镜像
FROM python:3.10.15-slim-bookworm

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt
COPY requirements.txt .

# 先安装系统依赖
RUN apt-get update && apt-get install -y \
    iproute2 \
    procps \
    cron \
    libglib2.0-0 \
    libnss3 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libxext6 \
    libxfixes3 \
    libpango-1.0-0 \
    libcairo2 \
    libxkbcommon0 \
    libxcb1 \
    libnspr4 \
    libexpat1 \
    libdbus-1-3 \
    libatspi2.0-0 \
    libcups2 \
    fonts-noto-color-emoji \
    fonts-noto-cjk \
    locales \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python 包
RUN pip install --no-cache-dir -r requirements.txt

# 安装 chromium
RUN patchright install chromium
