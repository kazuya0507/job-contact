# CarrierWaveの設定呼び出し
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 保存先の分岐
CarrierWave.configure do |config|
  Rails.env.production? # 本番環境:AWS使用
    config.storage :file
    config.file_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'
    }
    config.file_directory  = 'job-contact'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/job-contact'
end