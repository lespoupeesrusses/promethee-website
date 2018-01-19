class Page < ApplicationRecord
  has_many :localizations
  
  def to_s
    "#{title.blank? ? 'Untitled page' : title}"
  end
end
