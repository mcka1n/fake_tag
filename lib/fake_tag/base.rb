module FakeTag
  module Base

    def generate amount = nil
      result = []
      if amount.nil?
        result = self.loop 4
      else
        result = self.loop amount
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
      amount.times do
        data = tags[rand(0..tags.count-1)]
        result << data unless result.include? data
      end
      result
    end

  end
end
