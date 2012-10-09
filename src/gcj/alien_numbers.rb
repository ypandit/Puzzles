# Alien Numbers - http://code.google.com/codejam/contest/dashboard?c=32003

# @author - Yogesh Pandit
# @date - Aug 21, 2011

def get_cases(filename)
  file = File.new(filename, 'r')
  cases = []
  while line=file.gets
    vals = line.split(' ')
    if vals.length==3
      cases<<line
    end
  end
  return cases
end

=begin
  1.  Convert alien_number to decimal numeral system.
      This tell us the position of the alien_number in the source_language
      e.g: If source_language = O!CDE?, alien_number = CODE
           weight(C) * 6^3 + weight(O) * 6^2 + weight(D) * 6^1 + weight(E) * 6^0
         = 2*216 + 0*36 + 3*6 + 4*1
         = 454

  2.  Using the position, convert the alien_number to target_language
      e.g: If target_language = A?JM!., position = 454
           454%6 = 4; A?JM!.[4] = !; 454/6 = 75
           75%6 = 3; A?JM!.[3] = M; 75/6 = 12
           12%6 = 0; A?JM!.[0] = A; 12/6 = 2
           2%6 = 2; A?JM!.[2] = J; 2/6 = 0
           result = "J"+"A"+"M"+"!" = JAM!
=end

def translate(c)
  vals = c.split(' ')
  alien_num = vals[0]

  num_len = alien_num.length
  position = 0.to_i

  alien_num.each_char do |i|
    #puts "#{i}, #{vals[1].index(i)}, #{vals[1].length ** (num_len-1)}"
    position += vals[1].index(i) * (vals[1].length ** (num_len-1))
    num_len-=1
  end
  #puts position

  trans = ""
  while (position.to_i>0)
    #puts "#{vals[2].split(//)[position.to_i%vals[2].chomp.length]}"
    trans = vals[2].split(//)[position.to_i%vals[2].chomp.length] << trans
    #puts position
    position = position/vals[2].chomp.length
  end
  return trans
end


filename = '././data/gcj/AN-large.in'
index = 1

cases = get_cases(filename)
cases.each do |c|
  puts "Case ##{index}: #{translate(c)}"
  index = index.next
end

