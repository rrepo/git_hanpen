class Comment < ActiveRecord::Base
    belongs_to :pen
    belongs_to :user
end
