require 'rails_helper'

RSpec.describe "Article", type: :request do
  
  RSpec.shared_examples 'successful response' do
    it 'has successful response' do
      expect(response).to(have_http_status(:ok))
    end
  end

  describe "GET #index" do
    before(:each) do
      get(articles_url)
    end
    
    include_examples "successful response"

    it "renders its template" do
      expect(response).to(render_template(:index))
    end
  end #describe "GET #index"

  describe "GET #show" do
    let(:article_one) { Article.create(title: 'A', body: 'abcd') }
    
    before(:each) do
      get(article_url(article_one))
    end
    
    include_examples "successful response"

    it "renders its template" do
      expect(response).to(render_template(:show))
    end

    it 'handles a not-found article' do
      expect {
        get(article_url("0000"))
      }.to(
        raise_error(ActiveRecord::RecordNotFound)
      )
    end
  end #describe "GET #show"

  describe 'GET #new' do
    include_examples "successful response"
    
    it 'renders its template' do
      get(new_article_url)
      expect(response).to(render_template(:new))
    end
  end #describe 'GET #new'

end #file
