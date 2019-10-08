class Parking < ApplicationRecord
    validates :plate, format: { with: /\A[a-zA-Z]{3}\-\d{4}\z/, message: "Invalid Plate Format!" }, presence: true
    validates :entry_at, presence: true
    
    # Model Callbacks
    before_create :record_parking


    # Model Methods

    private def record_parking
        self.paid = false
        self.left = false
    end
end