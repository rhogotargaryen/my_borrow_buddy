class Transaction < ApplicationRecord
    belongs_to :item
    
    def request
        self.update(recipient_id: current_user.id, category: "request", settled: false)
    end
    
    
end
