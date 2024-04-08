# frozen_string_literal: true

require 'aws-sdk-s3'

S3_CLIENT = Aws::S3::Client.new(
  region: 'ap-southeast-1',
  credentials: Aws::Credentials.new(
    Rails.application.credentials.aws.access_key_id,
    Rails.application.credentials.aws.secret_access_key
  )
)

S3_PRESIGNER = Aws::S3::Presigner.new({ client: S3_CLIENT })
