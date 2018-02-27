@name = []
@point = []

def count_ballot(place, name)
  if @name.index(name) == nil
    @name << name
    n = @name.size - 1
    @point[n] = check_point(place)
  else
    n = @name.index(name)
    @point[n] += check_point(place)
  end
end

def check_point(place)
  case place
  when 1
    return 3
  when 2
    return 2
  when 3
    return 1
  end
end

ballots = [{1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
           {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
           {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
           {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}]

ballots.each do |ballot|
  ballot.each do |key, value|
    count_ballot(key, value)
  end
end

@highest_point = 0
@highest_index = 0
@point.each_index do |n|
  puts "#{@name[n]} has #{@point[n]} points."
  if @point[n] > @highest_point
    @highest_point = @point[n]
    @highest_index = n
  end
end

puts "The winner is #{@name[@highest_index]}."
