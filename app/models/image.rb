# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id             :uuid             not null, primary key
#  extension      :string           default("txt"), not null
#  imageable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :uuid
#
# Indexes
#
#  index_images_on_imageable_id  (imageable_id)
#
class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  before_destroy :remove_from_s3
  after_save :create_presigned_url, if: :id_previously_changed?

  attr_reader :presigned_url
  @@BUCKET = Rails.application.credentials.dig(:aws, :bucket)

  def create_presigned_url
    @presigned_url = S3_PRESIGNER.presigned_url(:put_object, bucket: @@BUCKET, key: "#{id}.#{extension}")
  end

  def url
    "https://#{@@BUCKET}.s3.ap-southease-1.amazonaws.com/#{id}.#{extension}"
  end

  def extension=image_extension
    super(image_extension || 'txt')
  end

  def remove_from_s3
    S3_CLIENT.delete_object({
                              bucket: @@BUCKET,
                              key: id
                            })
  end
end
