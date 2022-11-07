require 'rails_helper'

RSpec.describe(Article, type:(:request)) do #start of spec file
  
  RSpec.shared_examples 'successful response' do
    it 'has successful response' do
      expect(response).to(have_http_status(:ok))
    end
  end

  RSpec.shared_examples 'renders its template' do
    it 'renders its template' do
      expect(response).to(render_template(template.to_sym))
    end
  end

  RSpec.shared_examples 'creates a new Article object' do
    let(:article_one_create) { post(articles_url, params: { article: { title: 'one', body: 'abcd' } }) }
    let(:article_two_create) { post(articles_url, params: { article: { title: 'two', body: 'efgh' } }) }

    it 'finds the newly created Article object' do
      article_one_create
      expect(response).to(have_http_status(:found))
      
      expect { 
        post(articles_url, params: { article: { title: 'two', body: 'efgh' } })
      }.to change(Article, :count).by(1)
    end
  end

  describe "GET #index" do
    before(:each) do
      get(articles_url)
    end
    
    include_examples "successful response"

    let(:template) { template = "index" }
    include_examples "renders its template"
  end #describe "GET #index"

  describe "GET #show" do
    let(:article_one) { Article.create(title: 'A', body: 'abcd') }
    
    before(:each) do
      get(article_url(article_one))
    end
    
    include_examples "successful response"
    
    let(:template) { template = "show" }
    include_examples "renders its template"

    it 'handles a not-found article' do
      expect {
        get(article_url("0000"))
      }.to(
        raise_error(ActiveRecord::RecordNotFound)
      )
    end
  end #describe "GET #show"

  describe 'GET #new' do
    before(:each) do
      get(new_article_url)
    end
  
    include_examples("successful response")
    
    let(:template) { template = "new" }
    include_examples("renders its template")
  end #describe 'GET #new'

  describe 'POST #create' do
    include_examples("creates a new Article object")
  end #describe "POST #create"

  describe 'GET #edit' do
    # include_examples("creates a new Article object")
  end

end #file
