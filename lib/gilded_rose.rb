class GildedRose
  attr_reader :item

  def self.new(name, quality, days_remaining)
    @item = klass_for(name).new(quality, days_remaining)

  end

  def self.klass_for(name)
    case name
    when 'Normal Item'
      Normal
    when 'Aged Brie'
      Brie
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      Backstage
    end
  end

  # def tick
  #   item.tick
  # end

  # def quality
  #   item.quality
  # end

  # def days_remaining
  #   item.days_remaining
  # end


  # def normal_tick
  #   @item = Normal.new(quality, days_remaining)
  #   item.tick
  # end
  
  # def brie_tick
  #   @item = Brie.new(quality, days_remaining)
  #   item.tick
  # end

  # def sulfuras_tick
  #   @item = Sulfuras.new(quality, days_remaining)
  #   item.tick
  # end

  # def backstage_tick
  #   @item = Backstage.new(quality, days_remaining)
  #   item.tick
  # end
  class Item
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end
  end


  class Normal
    attr_reader :quality, :days_remaining
  
    def tick
      @days_remaining -= 1
      return if @quality == 0
      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie
    attr_reader :quality, :days_remaining

    def tick
      @days_remaining -= 1
      return if @quality >= 50
      @quality += 1
      @quality += 1 if @days_remaining <= 0
    end
  end
  
  class Sulfuras
    attr_reader :quality, :days_remaining

    def tick
      # Do nothing
    end
  end

  class Backstage
    attr_reader :quality, :days_remaining

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
end
