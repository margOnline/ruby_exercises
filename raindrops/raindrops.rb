class Raindrops

  def convert num
    unless has_prime_factor?(num)
      return num.to_s
    end

    result = ''
    result << 'Pling' if divisible_by?(3, num)
    result << 'Plang' if divisible_by?(5, num)
    result << 'Plong' if divisible_by?(7, num)
    result
  end

  def has_prime_factor?(num)
    (divisible_by?(3, num) || divisible_by?(5, num) || divisible_by?(7 ,num)) 
  end

  def divisible_by?(divisor, num)
    num % divisor == 0    
  end

end