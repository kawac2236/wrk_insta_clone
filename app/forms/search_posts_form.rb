class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :content, :string

  # 検索対象となるPostを返却する
  def search
    scope = Post.distinct
    scope = scope.content_contain(content) if content.present?
    scope
  end
end
