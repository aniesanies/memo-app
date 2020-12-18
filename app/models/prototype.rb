class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search != ""
      Prototype.where('text LIKE(?)', "%#{search}%")
    else
      Prototype.all
    end
  end
end
