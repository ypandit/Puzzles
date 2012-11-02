# Double Squares - https://www.facebook.com/hackercup/problems.php/?round=4

# @author - Yogesh Pandit
# @date - Nov 12, 2011

def find_double_squares(x)
  count = 0;
  for i in 0..Math.sqrt(x).to_i
    j = Math.sqrt(x - i*i)
    if j == j.to_i
      if i*i == j
        count += 2
      else
        count += 1
      end
    end
  end
  return count/2
end

if __FILE__ == $0
  filename = "././data/facebook/DS-sample.in"
  file = File.new(filename, 'r')
  num_cases = file.gets().to_i
  #puts num_cases
  for i in 1..num_cases
    count = find_double_squares(file.gets().to_i)
    puts "#{count}"
  end
end