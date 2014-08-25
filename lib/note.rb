class Note < ActiveRecord::Base
  belongs_to :doable, :polymorphic => true
  validates :description, presence: true
  after_validation :normalize_description, on: :create

  private
    def normalize_description
      self.description != nil ? self.description = self.description.downcase.titleize : return
    end
end
