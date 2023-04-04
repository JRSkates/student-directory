def input_students
  puts "Please enter the name, age and country of birth of the students,\nseparated by a comma."
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the info from the user and split it to 3 variables
  info = gets.chomp.split(',')
  name, age, country = info
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, age: age, country: country, cohort: :november}
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

# This print method is refactored to use a while loop
# rather than the .each method
def print(students)
  puts "Refactored to use a while loop"
  count = 0
  while count < students.length
    puts "#{count + 1}. #{students[count][:name]},#{students[count][:age]} years old, Born In:#{students[count][:country]} (#{students[count][:cohort]} cohort)" 
    count += 1
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