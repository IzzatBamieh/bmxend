class Bike < ApplicationRecord
  has_paper_trail
  has_many :police_reports
end
