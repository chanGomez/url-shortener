class Link < ApplicationRecord
  has_many :views, dependent: :destroy
  scope :recent_first, -> {order(created_at: :desc)}

  validates :url, presence: true

  def self.find(id)
    super Base62.decode(id)
  end

  def to_param
    Base62.encode(id)
  end

  def domain
    URI(url).host rescue StandardError URI::InvalidURIError
  end
end
