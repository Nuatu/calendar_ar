class To_do < ActiveRecord::Base
  has_many :notes, :as => :doable
  validates :description, presence: true
  after_validation :normalize_description, on: :create

  private
    def normalize_description
      self.description != nil ? self.description = self.description.downcase.titleize : return
    end
end
