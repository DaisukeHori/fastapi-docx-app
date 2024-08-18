# fastapi-docx-app

## 概要

`fastapi-docx-app`は、FastAPIを使用してDOCXファイルを生成するためのアプリケーションです。ユーザーがアップロードしたDOCXテンプレートに、JSONデータを挿入して新しいDOCXファイルを生成します。このアプリケーションは、Dockerコンテナ内で実行されるように設計されています。

## 特徴

- DOCXテンプレートファイルのアップロード
- JSONデータに基づくテキストの置換と表の生成
- Base64エンコードされた画像の挿入

## 必要条件

- Dockerがインストールされていること
- Python 3.10

## インストール方法

### 1. リポジトリのクローン

```bash
git clone https://github.com/DaisukeHori/fastapi-docx-app.git
cd fastapi-docx-app
```

### 2. Dockerイメージのビルド

```bash
docker build -t fastapi-docx-app .
```

### 3. Dockerコンテナの起動

```bash
docker run -d -p 8000:8000 fastapi-docx-app
```

これで、FastAPIアプリケーションがローカルのポート8000で稼働します。

## 使い方

### エンドポイント

`POST /generate-docx/`

- `template_file`: DOCXテンプレートファイル (multipart/form-data)
- `json_data`: テンプレートに挿入するJSON形式のデータ (form-data)

### リクエストの例

以下は、リクエストの例です。

```bash
curl -X POST "http://localhost:8000/generate-docx/" -F "template_file=@template.docx" -F "json_data={\"name\": \"John Doe\", \"age\": \"30\"}"
```

### レスポンス

生成されたDOCXファイルがバイナリ形式で返されます。

## 開発

このプロジェクトを開発環境で実行するには、以下の手順を使用します。

1. 仮想環境の作成とアクティベート

```bash
python -m venv venv
source venv/bin/activate
```

2. 依存関係のインストール

```bash
pip install -r requirements.txt
```

3. アプリケーションの起動

```bash
uvicorn app:app --reload
```

## ライセンス

このプロジェクトはMITライセンスの下で提供されています。詳細は`LICENSE`ファイルを参照してください。
