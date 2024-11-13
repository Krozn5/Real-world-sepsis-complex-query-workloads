#!/bin/bash

# 初始化数据库
initdb -D /var/lib/pgsql/13.1/data --username="postgres"

# 配置 pg_hba.conf 以允许密码认证
echo "host all all all md5" >> /var/lib/pgsql/13.1/data/pg_hba.conf

# 配置监听地址为所有地址，以便 Docker 外部能够访问
echo "listen_addresses = '*'" >> /var/lib/pgsql/13.1/data/postgresql.conf

# 调整 PostgreSQL 的 WAL 文件大小限制
sed -i 's/max_wal_size = 1GB/max_wal_size = 50GB/g' /var/lib/pgsql/13.1/data/postgresql.conf

# 增加共享缓冲区（此处调整为 4GB，实际应用中请根据机器内存进行调整）
sed -i 's/shared_buffers = 128MB/shared_buffers = 4GB/g' /var/lib/pgsql/13.1/data/postgresql.conf

# 禁用 GEQO（遗传算法优化器）
echo "geqo = off" >> /var/lib/pgsql/13.1/data/postgresql.conf

# 禁用并行查询，以避免并行执行相关的错误
echo "max_parallel_workers = 0" >> /var/lib/pgsql/13.1/data/postgresql.conf
echo "max_parallel_workers_per_gather = 0" >> /var/lib/pgsql/13.1/data/postgresql.conf

# 配置 PostgreSQL 数据库的日志文件位置
echo "log_directory = '/var/lib/pgsql/13.1/data/log'" >> /var/lib/pgsql/13.1/data/postgresql.conf
echo "log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'" >> /var/lib/pgsql/13.1/data/postgresql.conf

# 创建日志目录并设置权限
mkdir -p /var/lib/pgsql/13.1/data/log
chown -R pg:pg /var/lib/pgsql/13.1/data/log

# 启动 PostgreSQL 服务
echo "PostgreSQL initialized and configured successfully. Starting PostgreSQL..."

# 启动 PostgreSQL
/usr/local/pgsql/13.1/bin/pg_ctl -D /var/lib/pgsql/13.1/data -l /var/lib/pgsql/13.1/data/log/postgresql.log start

# 设置 pg 用户密码为 123456
psql -U postgres -c "CREATE USER pg WITH PASSWORD '123456';"

# 关闭 PostgreSQL 服务
/usr/local/pgsql/13.1/bin/pg_ctl -D /var/lib/pgsql/13.1/data stop
