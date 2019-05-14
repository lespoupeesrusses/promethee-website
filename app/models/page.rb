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
  include PrometheeData

  has_many :localizations

  before_save :sync_title_with_promethee_data

  def to_s
    "#{title.blank? ? 'Untitled page' : title}"
  end

  private

  def sync_title_with_promethee_data
    if data.blank? || data == "{}"
      self.data = { type: 'page', id: SecureRandom.uuid, attributes: { 'searchable_title': title } }
    elsif title_changed?
      self.promethee_data_page_title = title
    elsif data_changed?
      self.title = promethee_data_page_title
    end
  end
end
