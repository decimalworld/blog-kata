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
FactoryBot.define do
  factory :image do
    imageable { association :article }
  end
end
