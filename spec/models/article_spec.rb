require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user).required }
    it { is_expected.to have_many(:favourite_articles) }
  end

  context 'Validations' do
    subject { create(:article)}
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(50)}
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_least(1).is_at_most(300)}
  end

  context 'Scopes' do
    let!(:article_1) { create(:article, title: "Lost") }
    let!(:article_2) { create(:article, title: "Found") }

    context '.with_title' do
      subject { Article.with_title(article_2.title) }

      it { is_expected.to contain_exactly(article_2)}
    end
  end
end