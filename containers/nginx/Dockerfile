FROM nginx:1.15.8

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
ADD ./containers/nginx/nginx.conf /etc/nginx/conf.d/app.conf

RUN mkdir -p /app/tmp/sockets
