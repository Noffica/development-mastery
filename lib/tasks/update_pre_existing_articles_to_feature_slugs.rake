desc "Update pre-existing Article objects to feature slugs"
task :update_article_for_slugs => :environment do
  require 'friendly_id'
  Article.find_each(&:save)
end
