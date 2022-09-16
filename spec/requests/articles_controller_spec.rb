require 'rails_helper'

RSpec.describe "Article", type: :request do
  RSpec.shared_examples 'successful response' do
    it 'has successful response' do
      expect(response).to(be_successful)
      expect(response).to(have_http_status(:ok))
    end
  end

  describe "GET #index" do
    before(:each) do
      get(articles_path)
    end
    
    include_examples "successful response"

    it "renders its template" do
      expect(response).to(render_template(:index))
    end
  end #describe

  describe "GET #show" do
    let(:article_one) { Article.create(title: 'A', body: 'abcd') }
    
    before(:each) do
      get(article_path(article_one))
    end
    
    include_examples "successful response"

    it "renders its template" do
      expect(response).to(render_template(:show))
    end
  end #describe
end #file
