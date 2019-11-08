class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :content, :string

  # 検索対象となるPostを返却する
  def search
    if content.present?
      Post.content_contain(content)
    else
      Post.all
    end
  end
end
