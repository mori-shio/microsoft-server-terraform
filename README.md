# minecraft-server-terraform

## 概要

基本は以下のサイトの内容をterraformで起動できるようにしたもの。

https://aws.amazon.com/jp/blogs/news/setting-up-a-minecraft-java-server-on-amazon-ec2/

元サイトとの相違点は以下。

- VPCはdefaultではなく新規作成している
  - publicサブネット、インターネットGWも新規作成している
- EC2インスタンスへの接続経路はSSHではなく、SSMを使用するようにしている
- セキュリティグループでIP制限をかけるようにしている

## 事前準備

- AWSアカウントの用意
- `.aws/credentials` の整備
- docker-compose実行環境の用意（Docker Desktop, etc）

## 使用方法

### 1. Docker Desktop の起動

docker-composeを実行できる環境を起動する。

### 2. variables.tf の調整

`variables.tf` を開く。

定義された変数の値を適宜変更する。

### 3. Terraformを使用してAWSリソースを作成する

作成先のAWSアカウントはホストマシンの `~/.aws/credentials` に記載された `default` が参照されるようになっている。

```bash
scripts/terraform-init-apply.sh
```

コマンド実行後の出力結果最後の `instance_public_ip` の値をコピーする。（表示例 ↓）

```bash
Outputs:

instance_public_ip = "xx.xxx.xx.xxx"
```

### 4. Minecraft から接続する

Minecraft（Java版）を起動する。

1. 【マルチプレイ】を選択
2. 【サーバーを追加】を選択
3. 「サーバーアドレス」に "3" でコピーしたIPアドレスを入力し、「完了」
4. 追加したサーバーを選択し、【サーバーに接続】を選択

### 5. Minecraft を遊ぶ

ワールド情報などの保存が必要な場合は、セッションマネージャーでインスタンスに入り、該当ファイルや設定などをどこかに待避しておくこと。

### 6. 作成したAWSリソースをすべて削除する

```bash
scripts/terraform-destroy.sh
```
