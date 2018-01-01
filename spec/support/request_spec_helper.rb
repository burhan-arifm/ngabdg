module RequestSpecHelper
  # Parse JSON responses to ruby hash
  def json
    JSON.parse(response.body)
  end
end