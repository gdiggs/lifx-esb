require "net/http"

class EmpireStateBuilding
  extend Memoist

  def colors
    response["colors"]
  end

  private

  memoize def response
    JSON.parse Net::HTTP.get(url)
  end

  def url
    URI("http://whatcoloristheempirestatebuilding.com/#{date.year}/#{date.month}/#{date.day}")
  end

  memoize def date
    Date.today
  end
end
