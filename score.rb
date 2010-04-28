# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#   
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  n = 0
  (1..9).each do |i|
    amount = dice.find_all{|d| d == i}.size
    case i
    when 1
      if amount > 2
        n += 1000 + (amount - 3) * 100
      else
        n += amount * 100
      end
    when 5
      if amount > 2
        n += 500 + (amount - 3) * 50
      else
        n += amount * 50
      end
    else
      if amount > 2
        n += i * 100
      end
    end
  end

  return n
end
