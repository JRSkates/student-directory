def input_students
  puts "Please enter for each student: the name, age, country of birth and finally the month of the cohort they are in, separated by a comma.".center(90)
  puts "To finish, just hit return twice".center(90)
  # create an empty array
  students = []
  warning_message = "WARNING: You have not entered all the recommended information for this student." 
  success_message = "Great! Adding that to the list of students"
  # get the info from the user and split it to 4 variables
  info = gets.chomp.split(',').map { |detail|  detail.to_sym }
  info.length == 4 ? (puts success_message.center(90)) : (puts warning_message.center(90))
  name, age, country, cohort = info
  # while the name is not empty, repeat this code
  while !info.empty? do
    # add the student hash to the array
    students << {name: name, age: age, country: country, cohort: cohort}
    puts "Now we have #{students.count} students".center(90)
    info = gets.chomp.split(',')
    info.length == 4 ? (puts success_message.center(90)) : (puts warning_message.center(90))
    name, age, country, cohort = info
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
    if students[count][:cohort].nil?
      puts "#{count + 1}. #{students[count][:name]},#{students[count][:age]} years old, Born In:#{students[count][:country]} (#{students[count][:cohort]} cohort)".center(90) 
      puts "WARNING: This student is missing key information".center(90)
      count += 1
    else
      puts "#{count + 1}. #{students[count][:name]},#{students[count][:age]} years old, Born In:#{students[count][:country]} (#{students[count][:cohort]} cohort)".center(90) 
      count += 1 
    end
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