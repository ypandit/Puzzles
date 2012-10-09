# It's A Small World' - https://www.facebook.com/careers/puzzles.php?puzzle_id=6

# @author - Yogesh Pandit
# @date - Sept 2, 2011

RAD_PER_DEG = 0.0175 # PI/180
EARTH_RADIUS = 6367 # Earth's radius in KM

def get_inputs(filename)
  inputs = []
  file = File.new(filename, 'r')
  while row=file.gets
    data = row.split("\s")
    @loc = Hash.new
    @loc["ID"] = data[0].to_i
    @loc["Latitude"] = data[1].to_i
    @loc["Longitude"] = data[2].to_i
    inputs << @loc
  end
  return inputs
end


def find_close_friends(inputs)
  inputs.length.times do |i|
    friends = []
    inputs.length.times do |j|
      if i!=j
        @f = Hash.new
        @f["ID"] = inputs[j]["ID"]
        #@f["Distance"] = get_haversine_distance(inputs[i], inputs[j])
        @f["Distance"] = get_euclidean_distance(inputs[i], inputs[j])
        #puts "#{inputs[i]["ID"]}, #{inputs[j]["ID"]} = #{@f["Distance"]}"
        friends << @f
      end
    end
    new_friends = friends.sort_by { |friend| friend["Distance"] }
    #puts new_friends
    puts "#{inputs[i]["ID"]} #{new_friends[0]["ID"]},#{new_friends[1]["ID"]},#{new_friends[2]["ID"]}"
  end
  puts
end


=begin
  The haversine formula is an equation important in navigation, giving great-circle distances between two points
  on a sphere from their longitudes and latitudes (http://en.wikipedia.org/wiki/Haversine_formula)

  haversin(θ) = (1 - cos(θ))/2
=end
def get_haversine_distance(loc1, loc2)
  deltaLat = (loc2["Latitude"] - loc1["Latitude"]) * RAD_PER_DEG
  deltaLon = (loc2["Longitude"] - loc1["Longitude"]) * RAD_PER_DEG

  # Calculate square of half the chord length between latitude and longitude
  a = Math.sin(deltaLat/2) * Math.sin(deltaLat/2) +
      Math.cos((loc1["Latitude"] * RAD_PER_DEG)) * Math.cos((loc2["Latitude"] * RAD_PER_DEG)) *
          Math.sin(deltaLon/2) * Math.sin(deltaLon/2)

  # Calculate the angular distance in radians
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

  distance = EARTH_RADIUS * c

  return distance

end


=begin
  Simple Euclidean distance with Latitude and Longitude as X, Y coordinates respectively
=end
def get_euclidean_distance(loc1, loc2)
  return Math.sqrt((loc1["Latitude"] - loc2["Latitude"])**2 + (loc1["Longitude"] - loc2["Longitude"])**2)

end


if __FILE__ == $0
  #filename = ARGV[0]
  filename = "././data/facebook/SW-sample.in"
  inputs = get_inputs(filename)
  find_close_friends(inputs)
end