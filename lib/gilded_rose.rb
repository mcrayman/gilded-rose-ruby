class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def normal_tick
    @item = Normal.new(quality, days_remaining)
    itemtick
  end

class Normal
  attr_reader :quality, :days_remaining

  def initialize(quality, days_remaining)
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick
    @days_remaining -= 1
    return if @quality == 0
    @quality -= 1
    @quality -= 1 if @days_remaining <= 0
  end

  # def tick
  #   case name
  #   when 'Normal Item'
  #     return normal_tick
  #   when 'Aged Brie'
  #     return brie_tick
  #   when 'Sulfuras, Hand of Ragnaros'
  #     return sulfuras_tick
  #   end


  def brie_tick
    @days_remaining -= 1
    return if @quality >= 50
    @quality += 1
    @quality += 1 if @days_remaining <= 0
  end

  def sulfuras_tick
    # Do nothing
  end

  def backstage_tick
    @days_remaining -= 1
    return if @quality >= 50
    return @quality = 0 if @days_remaining < 0
    @quality += 1
    @quality += 1 if @days_remaining <= 10
    @quality += 1 if @days_remaining <= 5
    @quality += 1 if @days_remaining <= 0 && @quality < 50
  end
end
