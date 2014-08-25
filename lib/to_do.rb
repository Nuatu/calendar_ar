class To_do < ActiveRecord::Base
  has_many :notes, :as => :doable

  private
    def normalize_description
      self.description = self.description.downcase.titleize
    end
end
