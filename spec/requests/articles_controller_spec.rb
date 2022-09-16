require 'rails_helper'

RSpec.describe "Article", type: :request do
  # let(:valid_attributes) { title: "Abcd", body: "Efgh" }

  describe "GET #index" do
    before(:each) do
      get(articles_path)
    end
    
    it 'has successful response' do
      expect(response).to(be_successful)
      expect(response).to(have_http_status(:ok))
    end
    it 'renders its template' do
      expect(response).to(render_template(:index))
    end
  end #describe

  describe "GET #show" do
    let(:article_one) { Article.create(title: 'A', body: 'abcd') }
    before(:each) do
      get(article_path(article_one))
    end
    
    it "has a successful response" do
      expect(response).to(be_successful)
    end
    it "renders its template" do
      expect(response).to(render_template(:show))
    end
  end #describe
end #file
