module Service
  class Dandelion
    API_URL = "https://api.dandelion.eu/"

    def self.annotations(text: )
      payload = { 
        text: text, 
        token: ENV['DANDELION_TOKEN'],
        include: 'types,categories',
        top_entities: 5
      }

      response = api(action: 'nex', payload: payload)
      response.fetch('annotations', nil)
    rescue RestClient::ExceptionWithResponse => e
      e.response
      nil 
    end

    def self.sentiment(text: )
      payload = { 
        text: text, 
        token: ENV['DANDELION_TOKEN']
      }

      response = api(action: 'sent', payload: payload)
      response.fetch('sentiment', nil)
    rescue RestClient::ExceptionWithResponse => e
      e.response
      nil 
    end


    def self.api(action: , payload: {})
      response = RestClient.post "#{API_URL}datatxt/#{action}/v1/?", payload
      response = JSON.parse(response.body)
      
      response
    end
  end
end