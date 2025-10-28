# 使用 python:3.10.19-bookworm 镜像作为基础镜像
FROM python:3.10.19-bookworm

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt
COPY requirements.txt .

# 先安装系统依赖
RUN apt-get update && apt-get install -y \
    iproute2 \
    procps \
    cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python 包
RUN pip install --no-cache-dir -r requirements.txt

# 安装 Chrome
RUN patchright install chrome
