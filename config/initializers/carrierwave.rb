CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAIBC24XQNQ44WW5JA",
    aws_secret_access_key: "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",
    region: "eu-central-1"
  }

  config.fog_directory = "georgeproject"
end