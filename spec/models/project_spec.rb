# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  creator_id  :integer          not null
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
