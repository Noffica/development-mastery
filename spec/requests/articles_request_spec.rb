require 'rails_helper'

RSpec.describe(Article, type: (:request)) do #start of spec file
  describe "GET #index" do
    before(:each) do
      get(articles_path)
    end

    it 'has a successful response' do
      expect(response).to(have_http_status(:ok))
    end

    it 'renders its template' do
      expect(response).to(render_template(:index))
    end
  end #describe "GET #index"

  describe "GET #show" do
    context "valid @article path" do
      let(:article_one) { FactoryBot.create(:article, :valid_attributes) }

      before(:each) do
        get article_path(article_one)
      end

      it 'has a successful response' do
        expect(response).to(have_http_status(:ok))
      end

      it 'renders its template' do
        expect(response).to(render_template(:show))
      end

      it "contains the @article's attributes" do
        expect(response.body).to  include(article_one.title)
                             .and include(article_one.body)
      end
    end #context
  end #describe "GET #show"

  describe 'GET #new' do
    before(:each) do
      get(new_article_path)
    end

    it 'has a successful response' do
      expect(response).to(have_http_status(:ok))
    end

    it 'renders its template' do
      expect(response).to(render_template(:new))
    end
  end #describe 'GET #new'

  describe 'POST #create' do
    context 'valid attributes' do
      let(:post_with_valid_attributes) {
        post(articles_url, params: { article: attributes_for(:article, :valid_attributes) })
      }

      it 'yields a "302 Found" response' do
        post_with_valid_attributes
        expect(response).to(have_http_status(:found))
      end

      it 'redirects to the created @article' do
        post_with_valid_attributes
        expect(response).to(redirect_to(Article.last))
      end

      it 'increments the count of Article by 1' do
        expect {
          post_with_valid_attributes
        }.to(
          change(Article, :count).by(1)
        )
      end
    end #context

    context 'invalid attributes' do
      let(:post_with_invalid_attributes) {
        post(articles_url, params: { article: attributes_for(:article, :no_attributes) })
      }

      it 'yields "422 Unprocessable entity" when params are invalid' do
        post_with_invalid_attributes
        expect(response).to(have_http_status(:unprocessable_entity))
      end

      it 'does *not* result in change of count of Articles' do
        expect {
          post_with_invalid_attributes
        }.to_not(
          change(Article, :count)
        )
      end
    end #context
  end #describe "POST #create"

  describe 'PATCH #update' do
    let(:article_one) { FactoryBot.create(:article, :valid_attributes) }
    let(:article_two) { FactoryBot.create(:article, :new_valid_attributes) }
    let(:new_valid_attributes) { attributes_for(:article, :new_valid_attributes) }
    let(:invalid_attributes)   { attributes_for(:article, :no_attributes) }

    context "success with valid new attributes for update" do
      before(:each) do
        # patch(article_url(article_one), params: { article: valid_attributes })
        patch(
          article_url(article_one),
          params: { article: new_valid_attributes }
        )
      end

      it 're-directs to the updated @article' do
        expect(response).to redirect_to(article_path(article_one))
      end

      it 'bears the updated attributes' do
        article_one.reload
        expect(article_one).to have_attributes(new_valid_attributes)
      end

      it 'does *not* change count of Articles' do
        expect { article_one.reload }.not_to change(Article, :count)
      end
    end #context

    context "expected errors with invalid new attributes for update" do
      it 'refuses to accept changes if updated @article becomes equivalent to an existing one' do
        patch(
          article_path(article_two),
          params: { article: { title: article_one.title, body: article_one.body } }
        )
        expect(response).to(have_http_status(:unprocessable_entity))
      end

      it 'refuses to accept changes on @article if new attributes are invalid' do
        patch(
          article_path(article_two),
          params: { article: invalid_attributes }
        )
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end #context

    context "successful update upon only partial duplication of @article data attributes" do
      let(:article_one_before_changes) { article_one }

      before(:each) do
        patch(
          article_path(article_one),
          params: { article: { title: article_one.title, body: article_two.body } }
        )
      end

      it 'successfully re-directs to updated @article' do
        expect(response).to redirect_to(article_path(article_one))
      end

      it 'bears the updated attributes' do
        expect(article_one.reload.title).to eql(article_one_before_changes.title)
        expect(article_one.reload.body).to  eql(article_two.body)
      end

      it 'does *not* change Article count' do
        expect { article_one.reload }.not_to change(Article, :count)
      end
    end

    context "existing @article can be updated with same, existing data attributes" do
      let(:article_one_before_changes) { article_one }

      before(:each) do
        patch(
          article_path(article_one),
          params: { article: { title: article_one.title, body: article_one.body } }
        )
      end

      it 'successfully re-directs to updated @article' do
        expect(response).to redirect_to(article_path(article_one))
      end

      it 'bears the same attributes' do
        expect(article_one.reload.title).to eql(article_one_before_changes.title)
        expect(article_one.reload.body).to  eql(article_one_before_changes.body)
      end

      it 'does *not* change Article count' do
        expect { article_one.reload }.not_to change(Article, :count)
      end
    end #context
  end #describe "PATCH update"

  describe "#DELETE" do
    let(:article_one) { FactoryBot.create(:article, :valid_attributes) }

    it "deletes the @article" do
      delete(article_path(article_one))
      expect(response).to redirect_to(articles_path)
    end

    it "reduces number of @article objects by 1" do
      article_one #instantiation
      expect {
        delete(article_path(article_one))
      }.to(
        change(Article, :count).by(-1)
      )
    end

    it 'displays notice of successful deletion' do
      deleted_article_title = article_one.title
      delete(article_path(article_one))
      expect(flash[:notice]).to(eq("Article \"#{deleted_article_title}\" has been deleted."))
    end
  end #describe #DELETE
end #of file
