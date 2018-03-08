# == Schema Information
#
# Table name: movieusers
#
#  id         :integer         not null, primary key
#  name       :string
#  provider   :string
#  uid        :string
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Movieuser < ApplicationRecord
    has_many :reviews
end
