class Note < ActiveRecord::Base
  belongs_to :doable, :polymorphic => true
end
