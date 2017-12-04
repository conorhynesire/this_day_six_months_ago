class TwitterController < ApplicationController
  include TwitterHelper
  def index
    @this_day_6_months_ago_text = TwitterHelper.get_wiki_data
  end
end
