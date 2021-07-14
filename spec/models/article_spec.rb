require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new(title: 'hi', content: 'hello', slug: 'test-slug') }
  it 'checks for title type' do
    expect(subject.title).to be_a(String)
  end
end
