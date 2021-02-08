
class HealthController < ApplicationController
  def health
    render nothing: true, status: :ok, content_type: "text/html"
  end
end
