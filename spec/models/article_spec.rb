# frozen_string_literal: true

require 'rails_helper'

# RSpec.describe Article, type: :model do
#   it 'tests article object' do
#     article = Article.create({title: 'Sample article title', content: 'Sample content', slug: 'article-slug'})
#   end
# end

# normally we would pass the data as above to create a valid object,
# however because we need many of these objects across our test suite, it makes sense to do it via a factory
# This also means we don't need to keep storing the logic of creating our article object

RSpec.describe Article, type: :model do
  let(:article) { build(:article) } # build(:article) => article is the factory name
  # we replace create with build so we don't need to touch the database for our tests - will speed the tests up

  before do
    article
  end

  it 'tests article object' do
    expect(article.title).to eq('Sample article title')
  end

  it 'tests article title type' do
    expect(article.title).to be_a(String)
  end

  describe '#validations' do
    it 'tests article is valid' do
      expect(article).to be_valid # same as article.valid? == true
    end

    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'validates the uniqueness of the slug' do
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include('has already been taken')
    end
  end
end
