class Scale < ApplicationRecord
    validates :date, presence: true
    validates :product_id, presence: true
    validates :weight, presence: true
    validates :unit, presence: true
    validates :category, presence: true
end
