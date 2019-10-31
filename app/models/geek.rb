class Geek < ApplicationRecord
  has_many :applies

  validates :name, presence: true
  validates :stack, presence: true
  validates :name, length: { in: 1..50 }
  validates :stack, inclusion: { in: ['Sinatra React','Ruby React','Rails','Java','PHP','Node','Front end','Full stack']}

end
