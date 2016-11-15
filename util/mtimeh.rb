#
# Read .mtimes from stdin and write human readable datetime
# usage : cat infile | ruby mtimeh.rb  > out.txt
#
#  sort -r .mtimes | ruby mtimeh.rb > out.txt
#

# read the infile and split into arrays... 
ARGF.each_with_index do |line, idx|

  aline = line.split("|")
  #puts 'aline2: ' +  aline.inspect
  puts "#{Time.at(aline[0].to_i)} | #{aline[0]} | #{aline[1]}"

end

