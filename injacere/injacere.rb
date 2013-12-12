class Array

  def injacere(memo=nil)
    result = memo == nil ? self.shift : memo
    self.each { |value| result = yield(result, value) }
    result
  end

end
