require "validator/finishdate_validator"

class Schedule < ApplicationRecord
  validates :title, presence: true,
                    length: { maximum: 20}
  validates :startdate, presence: true
  validates :finishdate, presence: true, 
             finishdate: { message: "は開始日より後の日付を設定してください。" }
  validates :memo, presence: true,
                   length: { maximum: 200}
  

  def start_finishdate_comparison
    if startdate > finishdate
      errors.add(:finishdate, '終了日は開始日より後の日付を設定してください。')
    end 
  end
end
