# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string
#  data       :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ApplicationRecord
  has_many :localizations

  include PrometheeData
  
  def to_s
    "#{title.blank? ? 'Untitled page' : title}"
  end
end
