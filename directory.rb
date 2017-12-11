
def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end

def print_names(names)
  names.each do |students|
    puts "#{students[:name]} (#{students[:cohort]} cohort). They like #{students[:hobby]}, and they are #{students[:height]}cm tall!"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students along with further details"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  while !name.empty? do
    puts "What is #{name}'s main hobby?"
    hobby = gets.chomp
    puts "How tall is #{name} in cm?"
    height = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, height: height}
    puts "Now we have #{students.count} students"
    puts "Next student?"
    name = gets.chomp
      if name == nil
        break
      end
  end
  students
end

students = input_students
print_header
print_names(students)
print_footer(students)
