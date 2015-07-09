class Book < ActiveRecord::Base
  belongs_to :category
  
  has_many :reviews, dependent: :destroy
  has_many :readings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  mount_uploader :picture, PictureUploader
  
  validates :category, presence: true 
  validates :number_page, numericality: {only_integer: true}
  validate :picture_size
  
  private
  def picture_size
    if picture.size > Settings.picture.max_size.megabytes
      errors.add :picture, t("error.picture_size")
    end
  end
end
