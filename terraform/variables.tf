## ===================
##   調整が必要な設定
## ===================

variable "instance_type" {
  # サーバスペック
  default = "t4g.small"
}

variable "allowed_ips" {
  # サーバへのアクセスを許可するIP
  # 0.0.0.0/0 が含まれている場合は制限がない状態なので、制限をかける場合は削除すること
  # GitHub等のパブリック空間へPushする際は気を付けること！！
  type    = list(string)
  default = [
    "0.0.0.0/0",
  ]
}

variable "mimecraft_download_url" {
  # https://www.minecraft.net/ja-jp/download/server の「Download minecraft_server.X.XX.XX.jar」のリンクURL
  default = "https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar"
}

## ===============================
##   必ずしも調整が必要ではない設定
## ===============================

variable "region" {
  # 東京リージョン
  default = "ap-northeast-1"
}

variable "app_name" {
  default = "minecraft-server"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "instance_ami" {
  # Amazon Linux 2023 AMI 2023.3.20240205.2 arm64 HVM kernel-6.1
  default = "ami-0bd8e937fc413a67d"
}
