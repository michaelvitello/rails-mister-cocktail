class Ingredient < ApplicationRecord

  has_many :doses
  has_many :cocktails, through: :doses
  before_destroy :check_for_dose

  validates :name, presence: true, uniqueness: true, allow_blank: false

  def check_for_dose
    if doses.any?
      self.errors[:base] << "Cannot delete ingredient while its dose exists."
      return false
    end
  end

end
