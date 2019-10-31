class Apply < ApplicationRecord
  belongs_to :geek
  belongs_to :job

  validates :read, inclusion: { in: [true, false] }
  validates :invited, inclusion: { in: [true, false] }
  validates :job_id, numericality: true
  validates :geek_id, numericality: true
end
