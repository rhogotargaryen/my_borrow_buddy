class Item < ApplicationRecord
    belongs_to :user
    has_many :transactions
    validates :name, presence: true
    
    def can_be_borrowed?
        self.owner_id == self.user_id && ['returned', 'added_item'].include?(self.requested)
    end
    
    def id_recipient
        self.transactions.last.sender_id
    end
    
    def borrower
        self.owner_id != self.user_id ? User.find(self.user_id) : 'possesion by owner'
    end
    
    def self.owned_by(o_id)
        self.where('owner_id = ?', o_id)
    end
    
    def self.borrowed
        self.where('user_id != owner_id').where('requested = ?', 'borrowed')
    end
    
    def self.borrowable
        self.where('user_id == owner_id').where('requested = ? OR requested = ?', 'added_item', 'returned')
    end
    
    def self.allow_borrow
        self.where('user_id == owner_id').where('requested = ?', 'submit_borrow')
    end
    
    def self.allow_return 
        self.where('user_id != owner_id').where('requested = ?', 'submit_return')
    end
    
end