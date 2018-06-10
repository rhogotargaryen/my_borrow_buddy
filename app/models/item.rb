class Item < ApplicationRecord
    belongs_to :user
    has_many :transactions
    
    def can_be_borrowed?
        self.owner_id == self.user_id && ['returned', 'added_item'].include?(self.requested)
    end
    
    def id_recipient
        self.transactions.last.sender_id
    end
    
end
