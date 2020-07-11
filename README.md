# README

## セットアップ
```
$ dockercompose up
```

## ECRのセットアップ
### AWSの設定

```
$ aws configure
```

### 環境変数の設定
```
export AWS_ECR_PATH=<your_account_id>.dkr.ecr.ap-northeast-1.amazonaws.com
```

### containerの更新

```
$ ./bin/setup_ecr_rails
$ ./bin/setup_ecr_nginx
```
