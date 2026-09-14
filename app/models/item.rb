class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :attachments

  def self.ransackable_attributes(auth_object = nil)
    %w[name status location]
  end

end