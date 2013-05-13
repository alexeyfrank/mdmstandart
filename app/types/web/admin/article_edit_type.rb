class Web::Admin::ArticleEditType < Article
  include BaseType

  attr_accessible :state_event
end