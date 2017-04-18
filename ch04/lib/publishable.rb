# Module
module Publishable
  attr_reader :published_on

  def publish!
    today = Time.now.strftime('%Y-%m-%d')
    @published_on = today
  end
end
