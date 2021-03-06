class Detail < ApplicationRecord
  validates :purchase_date, length: { maximum: 20 }
  validates :place, length: { maximum: 30 }
  validates :person, length: { maximum: 30 }
  validates :reason, length: { maximum: 100 }
  
  belongs_to :item 
end
