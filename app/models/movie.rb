# == Schema Information
#
# Table name: movies
#
#  id           :integer         not null, primary key
#  title        :string
#  rating       :string
#  description  :text
#  release_date :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Movie < ActiveRecord::Base
    has_many :reviews
end
