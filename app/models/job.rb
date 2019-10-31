class Job < ApplicationRecord
  belongs_to :company
  has_many :applies

  validates :name, presence: true
  validates :place, presence: true # presence - наличие
  #validates_associated :applies # использовать, когда у вашей модели есть связи с другими моделями, и их также нужно проверить на валидность.
  validates :name, length: { in: 1..50 }
  validates :place, inclusion: { in: ['Remote', 'Contract', 'Permanent'] }

end
