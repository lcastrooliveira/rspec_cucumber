# Weather
class Weather

  def initialize(api_client)
    @api_client = api_client
  end

  def today
    case @api_client.today
    when 'sunny'
      'good'
    end
  end
end

class ApiClient
end
