# 初期設定

## 設定ファイルの変更(変更点は該当ファイル参照)

+ docker-compose.yaml
+ db/init/init_db.sql

## コンテナをビルド
```
docker-compose build
```

## Djangoプロジェクトファイル生成
```
# 最後の.を忘れないこと
docker-compose run web django-admin startproject myapp .
```

## DjangoにPostgreを設定
src/settings.py
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'アプリ名',
        'USER': 'root',
        'PASSWORD': 'root',
        'HOST': 'db',
        'PORT': '5432',
    }
}
```

## Migrate
```
docker-compose run web python manage.py migrate
```

## ローカルサーバー起動
```
docker-compose up
```
