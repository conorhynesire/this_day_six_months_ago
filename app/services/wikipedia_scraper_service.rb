class WikipediaScraperService
  require 'open-uri'

  def initialize
    @wikipedia_url = "https://en.wikipedia.org"
  end


  #Scrapes on this day web page of wikipedia
  #Returns back a list of formatted article titles and links to the articles
  #Takes ruby date function e.g. 1.month.ago
  def scrape_on_this_day(date)
    formatted_date = date.strftime("%B_%-d")

    on_this_date_url =  @wikipedia_url+"/wiki/Wikipedia:Selected_anniversaries/"
    url_with_date    =  on_this_date_url + formatted_date

    #It's right about here I'd think of caching the response from wikipedia
    #(not pushed for this project... I totally looked into it though)
    document = Nokogiri::HTML(open(url_with_date))
    articles = document.xpath("//*[@id='mw-content-text']/div/ul[1]/li").map{|article| article.text}

    return articles
  end

  #Returns single article from "scrape_on_this_day"
  def get_random_article(date)
    articles = scrape_on_this_day(date)

    if articles != nil
      article = articles.sample
    end

    article ||= Time.now.strftime("%Y") + " – Conor's noticed that an has error happened"

    return article
  end

end
