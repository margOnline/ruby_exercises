class SpaceAge

  attr_reader :seconds

  def initialize age_in_seconds
    @seconds = (age_in_seconds).to_f
    @planet_years = {'earth' => 365.25 * 24 * 60 * 60, 'mercury' => 0.2408467,}
    @year_in_seconds = (365.25 * 24 * 60 * 60).to_f
  end

  def on_earth
    calculate_age_on 'earth'
  end

  def on_mercury
    calculate_age_on 'mercury'
  end

  def on_venus
    calculate_age_on 'venus'
  end

  def on_mars
    
  end

  def on_jupiter
    
  end

  def on_saturn
    
  end

  def on_uranus
    
  end

  def on_neptune
    
  end

  private

  def calculate_age_on planet
    (@seconds / @planet_years[planet]).round(2)
  end

end