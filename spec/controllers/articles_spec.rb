require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:user1) { create(:user) }
  let!(:article_1) { create(:article)}
  let!(:article_2) { create(:article, title: "Test_2")}
  let!(:article_3) { create(:article)}

  describe "GET index" do
    it "returns all articles" do
      sign_in user1
      get :index
      expect(response.code).to eq('200')
    end
  end
end
