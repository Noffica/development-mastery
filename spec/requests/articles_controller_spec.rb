require 'rails_helper'

RSpec.describe(Article, type: (:request)) do #start of spec file
  let(:article_one) { Article.create(title: 'A', body: 'abcd') } #TODO: sensible way?
  
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

  describe "GET #show (#edit aliased to #show)" do
    context "valid @article path" do
      before(:each) do
        get(article_url(article_one))
      end
      
      include_examples("has successful response")
      
      let(:template) { template = "show" }
      include_examples("renders its template")
      
      it "contains the @article's attributes" do
        expect(response.body).to  include(article_one.title)
                             .and include(article_one.body)
      end
    end #context

    context "invalid @article path" do
      it 'raises expected error for incorrect @article path' do
        expect {
          get(article_url("0000"))
        }.to(
          raise_error(ActiveRecord::RecordNotFound) #TODO: sensible way?
        )
      end
      
      it 'raises expected error when no / nil ID is provided' do #TODO get(article_url()) ≡ get(article_url(nil))?
        expect {
          get(article_url())
        }.to(
          raise_error(ActionController::UrlGenerationError) #TODO: sensible way?
        )
      end
    end #context
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
    context 'valid attributes' do
      let(:valid_attributes) { { title: 'one', body: 'abcd' } }
      
      it 'yields a "302 Found" response' do
        post(articles_url, params: { article: valid_attributes })
        expect(response).to(redirect_to(Article.last))
        expect(response).to(have_http_status(:found)) #TODO: does not the previous line satisfy this test as well?
      end

      it 'increments the count of Article by 1' do #TODO: relevant or testing db operation?
        expect {
          post(articles_url, params: valid_attributes)
        }.to(
          change(Article, :count).by(1)
        )
      end
    end #context

    context 'invalid attributes' do
      let(:invalid_attributes) { { title: nil, body: nil } }
      
      it 'yields "422 Unprocessable entity" when params are invalid' do
        post(articles_url, params: { article: invalid_attributes })
        expect(response).to(have_http_status(:unprocessable_entity))
      end
      
      it 'does *not* result in change of count of Articles' do
        expect {
          post(articles_url, params: { article: invalid_attributes })
        }.to_not(
          change(Article, :count)
        )
      end
    end #context
  end #describe "POST #create"



  describe 'PATCH #update' do
    let(:valid_attributes_new)   { { title: 'Updated title', body: 'Updated body' } }
    let(:invalid_attributes_new) { { title: nil,             body: nil } }

    before(:each) do
      patch(article_url(article_one), params: { article: valid_attributes_new })
    end

    context "success with valid new attributes for update" do
      it 're-directs to the updated @article' do
        expect(response).to redirect_to(article_url(article_one))
      end

      it 'bears the updated attributes' do
        expect(article_one.reload.title).to eql(valid_attributes_new[:title])
      end
    end #context

    context "does not create an additional @article" do
      it 'does *not* change Article count' do
        expect { 
          patch(article_url(article_one), params: { article: valid_attributes_new }) #TODO: a way to include in previous #context?
        }.to_not(
          change(Article, :count)
        )
      end
    end

    context "expected errors with invalid new attributes for update" do
      pending "raises expected error when attributes for update are invalid"
    end
  end #describe "PATCH update"
end #of spec file
