class ApplicationService

  private

  def parse_response(response)
    JSON.parse(response)
  end

  def handle_errors(response)
    parse_response(response.body)["message"]
  end

end
