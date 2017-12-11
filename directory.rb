
def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end

def print_names(names)
  names.each do |student|
    if student[:name].downcase.start_with?("e")
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
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
