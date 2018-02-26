class TwitterService

  #initialize twitter client
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "fw8V2aVVFnbI8kBRDsnOvQQtJ"
      config.consumer_secret     = "nvCQrspsejsBBY48w34erGIlgltezjXXojuOMgsriUgC9cvJgy"
      config.access_token        = "95097996-dbspuQTzkijyHaMxGM6a1G6IVSf7pfv3i0FKktmUu"
      config.access_token_secret = "a23xfqLMvaqs7nymCZ3PlOd7Uy4uQrOJCe5B98Zdi2gVj"
    end
  end

  def tweet_message(message)
    raise "Tweet too long" unless message.length <= 280
    @client.update(message)
  end

end
