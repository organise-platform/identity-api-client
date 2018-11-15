require_relative 'list'

module IdentityApiClient
  class Lists < Base
    def find_by_id(id)
      resp = client.get_request("/api/lists/#{id}?api_token=#{client.connection.configuration.options[:api_token]}")
      if resp.status == 200
        return IdentityApiClient::List.new(client: client, id: id)
      else
        false
      end
    end

    def search(query)
      resp = client.get_request("/api/lists/search?query=#{query}&api_token=#{client.connection.configuration.options[:api_token]}")
      if resp.status == 200

        return resp.body.map { |l| IdentityApiClient::List.new(client: client, id: l['id']) }
      else
        false
      end
    end
  end
end
