# frozen_string_literal: true

# == Schema Information
#
# Table name: jwt_denylists
#
#  id         :uuid             not null, primary key
#  exp        :datetime         not null
#  jti        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_jwt_denylists_on_jti  (jti)
#
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
end
