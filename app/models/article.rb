class Article < ActiveRecord::Base
  include ArticleRepository

  attr_accessible :content, :title

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  state_machine initial: :inactive do
    state :active
    state :inactive

    event :activate do
      transition [:inactive] => :active
    end

    event :deactivate do
      transition [:active] => :inactive
    end
  end
end
