@students = []
require 'csv'

def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end

def print_students_list
  @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students()
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    push_students_to_array(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the students from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      puts "What file would you like to load?"
      file = gets.chomp
      load_students(file)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again."
    end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = CSV.open("students.csv", "w") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
  puts "Saved to file successfully"
end

def push_students_to_array(name)
  @students << {name: name, cohort: :november}
end

def load_students(filename)
  CSV.foreach(filename) do |csv|
    name, cohort = csv
    push_students_to_array(name)
  end
  puts "Loaded #{filename} successfully"
end

def try_load_students
  filename = ARGV.first
  if (filename != nil) && (File.exist?(filename))
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  elsif (filename != nil) && (!File.exist?(filename))
    puts "Sorry #{filename} doesn't exist."
    exit
  elsif filename == nil
    load_students("students.csv")
  end
end

try_load_students
interactive_menu
