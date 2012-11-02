# Store Credit - http://code.google.com/codejam/contest/dashboard?c=351101#s=p0

def run(filename)
  file = File.new(filename, 'r')
  cases = file.gets
  count = 1
  while (count <= Integer(cases))
    credit = file.gets
    item = file.gets
    prices = file.gets
    do_the_deed(count, credit, item, prices)
    count += 1
  end
end

def do_the_deed(count, credit, items, prices)
  item_prices = prices.split(' ')
  for i in 0..item_prices.length-1
    for j in i+1..item_prices.length-1
      if (i!=j)
        sum = Integer(item_prices[i])+Integer(item_prices[j])
        if sum == Integer(credit)
          small = 0
          big = 0
          if Integer(i)>Integer(j)
            small = Integer(j)+1
            big = Integer(i)+1
          elsif Integer(j)>Integer(i)
            small = Integer(i)+1
            big = Integer(j)+1
          end
          puts "Case ##{count}: #{small} #{big}"
        end
      end
    end
  end
end

run("././data/gcj/SC-large.in")