require 'award'

def update_quality(awards)
  awards.each do |award|
    award.decrement_expires_in
    award.update_quality
    #if award.name != 'Blue Distinction Plus' && award.name != 'Blue First' && award.name != 'Blue Compare'
    #  if award.quality > 0
    #    award.quality -= 1
    #  end
    #  award.expires_in -= 1
    #  if award.quality > 0
    #    if award.expires_in < 0
    #      award.quality -= 1
    #    end
    #  end
    #end

    #if award.name == 'Blue Distinction Plus'
    #  # award.quality.must_equal 80
    #end

    #if award.name == 'Blue First'
    #  award.expires_in -= 1
    #  if award.quality < 50
    #    award.quality += 1
    #  end
    #  if award.quality < 50
    #    if award.expires_in < 0
    #      award.quality += 1
    #    end
    #  end
    #end

    #if award.name == 'Blue Compare'
    #  if award.quality < 50
    #    award.quality += 1
    #  end
    #  if award.quality < 50
    #    if award.expires_in < 11
    #      award.quality += 1
    #    end
    #  end
    #  if award.quality < 50
    #    if award.expires_in < 6
    #      award.quality += 1
    #    end
    #  end
    #  award.expires_in -= 1
    #  if award.expires_in < 0
    #    award.quality = 0
    #  end
    #end
  end
end
