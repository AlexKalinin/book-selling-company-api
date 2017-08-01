# frozen_string_literal: true
module Controllers
  module Helpers
    # parse response body, return JSON-object
    # require +render_views+ rspec method in spec (or result will be empty)
    def json
      JSON.parse(response.body)
    end
  end
end
