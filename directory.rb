
def print_header
  puts "The students of Villains Academy".center(80)
  puts "-----------------".center(80)
end

def print_names(names)
  names.each do |students|
    puts "#{students[:name]} (#{students[:cohort]} cohort)".center(80)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

students = input_students
print_header
print_names(students)
print_footer(students)
