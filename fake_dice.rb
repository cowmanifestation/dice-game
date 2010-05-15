class UnscoringDice
  
  def roll(n)
    [2,3,4,3,2]
  end
  
end


class SomeScoringDice
  attr_reader :values
  def roll(n)
    if n == 5
      @values = [1,2,3,4,5]
    elsif n == 3
      @values = [1,2,3]
    else
      #@values = (1..n).map { rand(6) + 1 }
    end
  end
  
  def delete_at(index)
    @values.delete_at(index)
  end
  
  def [](n)
    @values[n]
  end
  
  def find_all(&block)
    @values.find_all(&block)
  end
  
end

class AllScoringDice
  
  def roll(n)
    @values = [1,1,1,1,1]
  end

  def find_all(&block)
    @values.find_all(&block)
  end
  
end




class SomeScoringThenUnscoringDice
  
  attr_reader :values
  
  def roll(n)
    if n == 5
      @values = [1,2,3,4,5]
    elsif n == 3
      @values = [2,3,4]
    else
      @values = (1..n).map { rand(6) + 1 }
    end
  end
  
  def delete_at(n)
    @values.delete_at(n)
  end
  
  def find_all(&block)
    @values.find_all(&block)
  end

end
