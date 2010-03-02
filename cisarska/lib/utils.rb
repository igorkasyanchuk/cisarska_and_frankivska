SEARCH_ENGINE_NAMES = ['Spider', 'Meta', 'Google', 'Stack', 'Rambler', 'StackRambler', 'Spider' ,'Aport', 'Yahoo', 'MSN', 'Yandex', 'bot', 'MSIE incompatible', 'Bing', 'Crawler']

module StatisticsHelper
  
  def StatisticsHelper.allowed_ip?(request)
    return false if StatisticsHelper.bot?(request)
    true
  end
  
  def StatisticsHelper.bot?(request)
    user_agent = request.env['HTTP_USER_AGENT']
    user_agent ||= ''
    SEARCH_ENGINE_NAMES.detect{ |bot| bot if user_agent.match(bot)}
  end
  
end