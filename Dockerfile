# ベースイメージとして公式のPythonイメージを使用
FROM python:3.10-slim

# 作業ディレクトリを設定
WORKDIR /app

# 必要なシステムパッケージをインストール
RUN apt-get update && apt-get install -y \
    libpython3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 仮想環境のインストール（もし必要なら）
# COPY ./venv /app/venv

# 必要なPythonパッケージをインストール
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# アプリケーションコードをコピー
COPY ./app.py /app/app.py

# ポートを公開
EXPOSE 8000

# FastAPIサーバを起動
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
