class Company < ApplicationRecord
  has_many :jobs

  validates :name, presence: true
  validates :location, presence: true # presence - наличие
  #validates_associated :jobs # использовать, когда у вашей модели есть связи с другими моделями, и их также нужно проверить на валидность.

end
