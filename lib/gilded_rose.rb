class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    case name
    when 'Normal Item'
      @item = Normal.new(quality, days_remaining)
      item.tick
    when 'Aged Brie'
      @item = Brie.new(quality, days_remaining)
      item.tick
    when 'Sulfuras, Hand of Ragnaros'
      @item = Sulfuras.new(quality, days_remaining)
      item.tick
    when 'Backstage passes to a TAFKAL80ETC concert'
      @item = Backstage.new(quality, days_remaining)
      item.tick
    end
  end

  def normal_tick
    @item = Normal.new(quality, days_remaining)
    item.tick
  end
  
  def brie_tick
    @item = Brie.new(quality, days_remaining)
    item.tick
  end

  def sulfuras_tick
    @item = Sulfuras.new(quality, days_remaining)
    item.tick
  end

  def backstage_tick
    @item = Backstage.new(quality, days_remaining)
    item.tick
  end

  class Brie
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50
      @quality += 1
      @quality += 1 if @days_remaining <= 0
    end
  end
  
  class Sulfuras
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      # Do nothing
    end
  end

  class Backstage
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50
      return @quality = 0 if @days_remaining < 0
      @quality += 1
      @quality += 1 if @days_remaining <= 10
      @quality += 1 if @days_remaining <= 5
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
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
