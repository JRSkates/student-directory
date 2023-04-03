def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  # return the array 
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# This print method is modified to only print the 
# students whose names are shorter than 12 characters
def print(students)
  puts "Only showing students whose names are shorter than 12 characters"
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{(index + 1)}. #{student[:name]} (#{student[:cohort]} cohort)" 
    else 
      nil
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

#p students
#p students.first[:name][0]