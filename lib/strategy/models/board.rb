require "kablammo"

module Strategy::Model
  class Board
    def fixed_obstruction?(target)
      wall?(target) || dead_robot?(target)
    end

    def wall?(target)
      walls.any? { |w| w.located_at? target }
    end

    def robot?(target)
      robots.any? { |r| r.located_at? target }
    end

    def dead_robot?(target)
      robot = robots.find { |r| r.located_at? target }
      return false unless robot
      robot.dead?
    end
  end
end
