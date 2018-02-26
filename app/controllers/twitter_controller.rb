class TwitterController < ApplicationController
  def index
    wikipedia_scraper = WikipediaScraperService.new()

    @this_day_6_months_ago_text = wikipedia_scraper.get_random_article(6.months.ago)
  end
end
