# README

## アプリケーションのセットアップ

```
$ docker-compose run app bundle exec rails db:setup
$ docker-compose up
```

## ECRのセットアップ
terraformの構成としては[terraform-rails-mysql-pattern](https://github.com/yoshino/terraform-rails-mysql-pattern)を想定している。

### AWSの設定
```
$ aws configure
```

### 環境変数の設定
```
export AWS_ECR_PATH=<your_account_id>.dkr.ecr.ap-northeast-1.amazonaws.com
```

### ECRの更新

```
$ ./bin/setup_ecr_rails
$ ./bin/setup_ecr_nginx
```
