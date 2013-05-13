module ArticleRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :active, -> { where state: :active }
    scope :inactive, -> { where state: :inactive }

    scope :web, -> { by_created_at.active }
    scope :admin, -> { by_created_at }
  end
end