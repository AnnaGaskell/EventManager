require 'csv'
puts 'Event Manager Initialized!'

# lines = File.readlines('event_attendees.csv') #saves each line as a separate item in an array
# lines.each_with_index do |line,index|
#   next if index == 0 #skips header
#   columns = line.split(",") # break string along each ',' to separate columns
#   name = columns[2] #accessing the 3rd spot in the array
#   puts name
# end


contents = CSV.open(
    'event_attendees.csv', 
    headers: true,
    header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode]
    # if the zip code is exactly five digits, assume that it is ok
    if zipcode.length < 5
        zipcode = zipcode.rjust(5, '0')
    # if the zip code is more than five digits, truncate it to the first five digits
    elsif zipcode.length > 5
        zipcode = zipcode[0..4]
    # if the zip code is less than five digits, add zeros to the front until it becomes five digits
    end

    puts "#{name} #{zipcode}"
end



