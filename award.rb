module Award
  class NormalAward
    attr_reader :name, :expires_in, :quality
    def initialize(name, expires_in, quality)
      @name = name
      @expires_in = expires_in
      @quality = quality
    end

    def update_quality
      decrement_expiration
      decrement_quality
      decrement_quality if expired?
    end

    private

    def expired?
      @expires_in < 0
    end

    def decrement_expiration
      @expires_in -= 1
    end

    def expires_in_less_than?(n)
      @expires_in < n
    end

    def max_quality?
      @quality >= 50
    end

    def min_quality?
      @quality <= 0
    end

    def increment_quality
      @quality += 1 unless max_quality?
    end

    def decrement_quality
      @quality -= 1 unless min_quality?
    end
  end

  class BlueDistinctionPlusAward < NormalAward
    def initialize(name, expires_in, quality)
      super(name, expires_in, quality)
    end

    def update_quality
    end
  end

  class BlueFirstAward < NormalAward
    def initialize(name, expires_in, quality)
      super(name, expires_in, quality)
    end

    def update_quality
      decrement_expiration
      increment_quality
      increment_quality if expired?
    end
  end

  class BlueCompareAward < NormalAward
    def initialize(name, expires_in, quality)
      super(name, expires_in, quality)
    end

    def update_quality
      decrement_expiration
      if expired?
        @quality = 0
      else
        increment_quality
        increment_quality if expires_in_less_than?(10)
        increment_quality if expires_in_less_than?(5)
      end
    end
  end

  class BlueStarAward < NormalAward
    def initialize(name, expires_in, quality)
      super(name, expires_in, quality)
    end

    private

    def decrement_quality
      @quality -= 2 unless min_quality?
    end
  end

  CLASSES = {
    'Blue Distinction Plus' => BlueDistinctionPlusAward,
    'Blue First' => BlueFirstAward,
    'Blue Compare' => BlueCompareAward,
    'Blue Star' => BlueStarAward
  }

  def self.new(name, expires_in, quality)
    (CLASSES[name] || NormalAward).new(name, expires_in, quality)
  end
end
