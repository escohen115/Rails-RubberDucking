class Duck < ApplicationRecord
    belongs_to :student

    validates :name, presence: :true
end



