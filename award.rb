#Award = Struct.new(:name, :expires_in, :quality)

module Award
  def self.new(name, expires_in, quality)
    case name
    when 'Blue Distinction Plus'
      BlueDistinctionPlusAward.new(name, expires_in, quality)
    when 'Blue First'
      BlueFirstAward.new(name, expires_in, quality)
    when 'Blue Compare'
      BlueCompareAward.new(name, expires_in, quality)
    else
      OtherAward.new(name, expires_in, quality)
    end
  end
end

#class Award
#  def initialize(name, expires_in, quality)
#    AwardHelper.classify(name, expires_in, quality)
#  end
#end

class BlueDistinctionPlusAward
  attr_reader :name, :expires_in, :quality
  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def decrement_expires_in
  end

  def update_quality
  end
end

class BlueFirstAward
  attr_reader :name, :expires_in, :quality
  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def decrement_expires_in
    @expires_in -= 1
  end

  def update_quality
    if @quality < 50
      @quality += 1
    end
    if @quality < 50
      if @expires_in < 0
        @quality += 1
      end
    end
  end
end

class BlueCompareAward
  attr_reader :name, :expires_in, :quality
  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def decrement_expires_in
    @expires_in -= 1
  end

  def update_quality
    if @quality < 50
      @quality += 1
    end
    if @quality < 50
      if @expires_in < 10
        @quality += 1
      end
    end
    if @quality < 50
      if @expires_in < 5
        @quality += 1
      end
    end
    if @expires_in < 0
      @quality = 0
    end
  end
end

class OtherAward
  attr_reader :name, :expires_in, :quality
  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def decrement_expires_in
    @expires_in -= 1
  end

  def update_quality
    if @quality > 0
      @quality -= 1
    end
    if @quality > 0
      if @expires_in < 0
        @quality -= 1
      end
    end
  end
end
