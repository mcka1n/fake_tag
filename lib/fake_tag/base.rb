module FakeTag
  module Base

    def generate amount = nil
      result = []
      if amount.nil?
        #result = self.loop 4
        result = self.get_tag
      else
        #result = self.loop amount
        result = self.get_tag amount
      end

      result
    end

    def generate_tag_test amount = 1, keyword=''
      self.generate_tag keyword, amount
    end

    def generate_party_tag_test amount = 1, keyword=''
      self.generate_party_tag amount, amount
    end

    protected

    def tag_pool
      # TODO change this for something better (dynamic tags)
      ['v60', 'lipstick', 'nails', 'blackwidow', 'skateboard', 'happy',
        'selfie', 'bike', 'car', 'dress', 'computer', 'geekstuff', 'love',
        'android', 'ipad', 'nyc']
    end

    def loop amount
      result = []
      tags = self.tag_pool
      while result.length < amount do
        data = tags[rand(0..tags.count-1)]
        result << data unless result.include? data
      end
      result
    end

    def get_tag amount = 4, uri = 'http://www.ariadne.ac.uk/buzz/trending/tf/feed/trending-factor-buzz.xml'
      tags = []
      result = []
      
      doc = Nokogiri::XML(open(uri))
      for tag in doc.xpath("//node/term").map.to_a do
        tags << tag.text
      end

      if amount > tags.length then
        amount = tags.length
      end

      while result.length < amount do
        data = tags[rand(0..tags.count-1)]
        result << data unless result.include? data
      end
      result
    end

    def generate_tag keyword='', amount=4, key='xxxx'
      #TODO: Make it random
      uri = 'http://api.whatthetrend.com/api/trend/search_extended/json?api_key='+key.to_s+'&count='+amount.to_s+'&q='+keyword.to_s
      result = []
      data = JSON.parse(RestClient.get(uri))
      for slug in data["api"]["trends"]["trend"]
        result << slug["name"]
      end
      result
    end

    def generate_party_tag keyword='', amount=4, key='xxxx'
      #TODO: Make it random
      uri = 'http://api.whatthetrend.com/api/trend/search_extended/json?api_key='+key.to_s+'&count='+amount.to_s+'&q='+keyword.to_s
      result = []
      response = HTTParty.get(uri)

      for tag in response["api"]["trends"]["trend"]
        result << tag["name"]
      end
      result
    end

  end
end
