# == Schema Information
#
# Table name: forms
#
#  id         :bigint           not null, primary key
#  creator    :string
#  font       :integer
#  payload    :json
#  slug       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_forms_on_slug  (slug) UNIQUE
#
require "test_helper"

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
