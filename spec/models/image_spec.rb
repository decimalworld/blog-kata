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
require 'rails_helper'

RSpec.describe Image do
  let(:image) { build(:image) }

  context 'when associate' do
    it do
      expect(image).to belong_to(:imageable)
    end
  end

  context 'when create' do
    let(:image) { create(:image) }

    it { expect(image.presigned_url).not_to be_blank }
  end
end
