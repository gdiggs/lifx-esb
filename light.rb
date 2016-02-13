class Light
  extend Memoist

  attr_reader :label

  def initialize(label)
    @label = label
  end

  def set_color(color)
    puts "Setting light to #{color}"

    lights.turn_on
    lights.set_color(LIFX::Color.send(color.downcase), duration: 1)
  end

  private

  memoize def client
    LIFX::Client.lan.discover! do |c|
      c.lights.with_label label
    end
  end

  memoize def lights
    client.lights.with_label label
  end
end
