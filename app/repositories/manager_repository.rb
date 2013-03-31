module ManagerRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :active, -> { where state: :active }
    scope :inactive, -> { where state: :inactive }

    scope :web, -> { active.asc_by_full_name }
    scope :admin, -> { by_created_at }
  end
end