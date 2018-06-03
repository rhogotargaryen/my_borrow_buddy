class StaticController < ApplicationController
    
    def test
        @testing = current_user
    end
end