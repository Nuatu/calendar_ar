class Note < ActiveRecord::Base
  belongs_to :doable, :polymorphic => true

  validates :description, presence: true

  before_validation :normalize_description, on: :create

  private
    def normalize_description
      self.description = self.description.downcase.titleize
    end
end
