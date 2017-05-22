class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city_id, presence: true
  belongs_to :company
  belongs_to :city
  belongs_to :category
end
