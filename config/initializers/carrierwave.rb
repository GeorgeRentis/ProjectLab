CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAJEYJF4X7IELYXTFA",
    aws_secret_access_key: "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",
    region: "eu-west-1"
  }

  config.fog_directory = "rostergr"
end