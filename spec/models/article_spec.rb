require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'tests article object' do
    article = Article.create({title: 'Sample article title', content: 'Sample content', slug: 'article-slug'})
    # normally we would pass the data as above to create a valid object,
    # however because we need many of these objects across our test suite, it makes sense to do it via a factory
    # This also means we don't need to keep storing the logic of creating our article object
  end
end
