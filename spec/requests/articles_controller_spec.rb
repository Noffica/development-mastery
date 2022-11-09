require 'rails_helper'

RSpec.describe(Article, type: (:request)) do #start of spec file
  let(:article_one) { Article.create(title: 'A', body: 'abcd') }
  
  RSpec.shared_examples 'has successful response' do
    it 'has successful response' do
      expect(response).to(have_http_status(:ok))
    end
  end

  RSpec.shared_examples 'renders its template' do
    it 'renders its template' do
      expect(response).to(render_template(template.to_sym))
    end
  end

  describe "GET #index" do
    before(:each) do
      get(articles_url)
    end
    
    include_examples "has successful response"

    let(:template) { template = "index" }
    include_examples "renders its template"
  end #describe "GET #index"

  describe "GET #show" do
    before(:each) do
      get(article_url(article_one))
      
      include_examples("has successful response")
    end
    
    let(:template) { template = "show" }
    include_examples("renders its template")

    it 'raises expected error for non-existent @article' do
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
  
    include_examples("has successful response")
    
    let(:template) { template = "new" }
    include_examples("renders its template")
  end #describe 'GET #new'

  describe 'POST #create' do
    context 'valid @article' do
      let(:valid_article) { { article: { title: 'one', body: 'abcd' } } }
      
      it 'yields a "302 Found" response' do
        post(articles_url, params: valid_article)
        expect(response).to(have_http_status(:found))
      end

      it 'increments the count of Article by 1' do
        expect {
          post(articles_url, params: valid_article)
        }.to(
          change(Article, :count).by(1)
        )
      end
    end #context

    context 'invalid @article\'s' do
      # let(:invalid_article) { { article: { title: nil, body: nil } } }
      
      after(:each) do
        expect(response).to have_http_status(:unprocessable_entity)
        # expect { post(articles_url, params: invalid_article) }.to change(Article, :count).by(0)
      end

      it 'yields "422 Unprocessable entity" with "title: nil" and valid body' do
        post(articles_url, params: { article: { title: nil, body: 'abcd' } })
      end

      it 'yields "422 Unprocessable entity" with "title" an empty string and "body" as valid' do
        post(articles_url, params: { article: { title: '', body: 'zxcv' } })
      end

      it 'yields "422 Unprocessable entity" with "title" as only spaces and "body" as valid' do
        post(articles_url, params: { article: { title: '  ', body: 'abcd' } })
      end

      it 'yields "422 Unprocessable entity" with "title" as valid and "body" as nil' do
        post(articles_url, params: { article: { title: 'a', body: nil } })
      end

      it 'yields "422 Unprocessable entity" with "title" as valid and "body" as empty string' do
        post(articles_url, params: { article: { title: 'a', body: '' } })
      end

      it 'yields "422 Unprocessable entity" with "title" as valid and "body" as blank spaces' do
        post(articles_url, params: { article: { title: 'a', body: '  ' } })
      end

      pending 'both attributes invalid: nil, empty string, blank spaces'
    end
  end #describe "POST #create"

  describe 'GET #edit' do
    before(:each) do
      get(edit_article_url(article_one))
    end
    
    include_examples("has successful response")

    let(:template) { template = "edit" }
    include_examples("renders its template")
  end #describe "GET #edit"

  describe 'PATCH #update' do
    it 'updates the @article' do
      patch(article_url(article_one), params: { article: { title: 'asdf', body: 'zxcv' } })
    end
  end #describe "PATCH update"
end #of spec file
