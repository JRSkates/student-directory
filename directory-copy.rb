def input_students
  puts "Please enter the name, age and country of birth of the students, separated by a comma.".center(90)
  puts "To finish, just hit return twice".center(90)
  # create an empty array
  students = []
  # get the info from the user and split it to 3 variables
  info = gets.chomp.split(',')
  name, age, country = info
  # while the name is not empty, repeat this code
  while !info.empty? do
    # add the student hash to the array
    students << {name: name, age: age, country: country, cohort: :november}
    puts "Now we have #{students.count} students".center(90)
    info = gets.chomp.split(',')
    name, age, country = info
  end
  # return the array 
  students
end

def print_header
  puts "The students of Villains Academy".center(90)
  puts "-------------".center(90)
end

# This print method is refactored to use a while loop
# rather than the .each method
def print(students)
  count = 0
  while count < students.length
    puts "#{count + 1}. #{students[count][:name]},#{students[count][:age]} years old, Born In:#{students[count][:country]} (#{students[count][:cohort]} cohort)".center(90) 
    count += 1
  end
end

def print_footer(students)
  puts
  puts "-------------".center(90)
  puts "Overall, we have #{students.count} great students".center(90)
end

students = input_students
print_header
print(students)
print_footer(students)

#p students
#p students.first[:name][0]