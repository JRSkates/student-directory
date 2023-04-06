require "csv"

@students = [] # an empty array accessible to all methods
@cohort = :november

def populate_student_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    populate_student_array(name, @cohort)
    # @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
  print_menu
  proccess(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv file"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def proccess(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Enter a name for the file you are saving this list too, remember to add .csv to the end"
    file_save = STDIN.gets.chomp
    puts "Saving students to #{file_save}..."
    save_students(file_save) unless file_save.nil?
  when "4"
    puts "What file would you like to load?"
    file_load = STDIN.gets.chomp
    load_students(file_load) unless file_load.nil?
  when "9"
    "Goodbye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students(file_to_save)
  # open the file for writing
  CSV.open(file_to_save, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
  puts "Students saved successfully"
end

def load_students(file_to_load)
  #puts "What file would you like to load?"
  #file_to_load = STDIN.gets.chomp
  if File.exist?(file_to_load) == false
    puts "File does not exist"
    return
  else
    CSV.foreach(file_to_load) do |line|
      name, cohort = line
      populate_student_array(name, cohort)
      # @students << {name: name, cohort: cohort.to_sym}
    end
  end
  puts "#{file_to_load} loaded and ready to view!"
end

def try_load_students
  filename = "students.csv" # ARGV.first first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu