module TwitterHelper
  require 'open-uri'

  def self.twatter(message)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "fw8V2aVVFnbI8kBRDsnOvQQtJ"
      config.consumer_secret     = "nvCQrspsejsBBY48w34erGIlgltezjXXojuOMgsriUgC9cvJgy"
      config.access_token        = "95097996-dbspuQTzkijyHaMxGM6a1G6IVSf7pfv3i0FKktmUu"
      config.access_token_secret = "a23xfqLMvaqs7nymCZ3PlOd7Uy4uQrOJCe5B98Zdi2gVj"
    end

    client.update(message)
  end

  def self.get_wiki_data
    date_6_months = (Date.today-6.months)
    day_date = date_6_months.strftime("%-d")
    month_name = date_6_months.strftime("%B")

    url_date =  "https://en.wikipedia.org/wiki/Wikipedia:Selected_anniversaries/"+month_name+"_"+day_date

    document = Nokogiri::HTML(open(url_date))
    articles = document.xpath("//*[@id='mw-content-text']/div/ul[1]/li")
    random_article = rand(1..articles.count)
    tweet = articles[random_article].text if articles[random_article] != nil
    tweet ||= Time.now.strftime("%Y") + " – Conor noticed an error happened"
    return tweet
  end


  def get_wiki_data
    return TwitterHelper.get_wiki_data
  end
end
