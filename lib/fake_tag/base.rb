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


  end
end
