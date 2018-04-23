# == Schema Information
#
# Table name: localizations
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  data       :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Localization < ApplicationRecord
  belongs_to :page
end
