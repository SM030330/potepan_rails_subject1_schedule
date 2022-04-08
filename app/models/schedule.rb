class Schedule < ApplicationRecord
  validates :title, presence: true,
                    length: { maximum: 20}
  validates :startdate, presence: true
  validates :finishdate, presence: true
  validates :memo, presence: true,
                   length: { maximum: 200}
  
end
