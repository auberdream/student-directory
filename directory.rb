
def print_header
  puts "The students of Villains Academy".center(80)
  puts "-----------------".center(80)
end

def print_names(names)
  names.select { |students| puts "#{students[:name]}, #{students[:cohort]} cohort".center(80) if students[:cohort] == :November }
end

def print_footer(names)
  if names.count == 0
    puts "We currently have no students".center(80)
  elsif names.count == 1
    puts "Overall, we have #{names.count} great student!".center(80)
  else
    puts "Overall, we have #{names.count} great students".center(80)
  end
end

def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice"
  students =[]
  loop do
    puts "Name?"
    name = gets.strip.downcase.capitalize
    if name.empty? == true
      break loop
    end
    puts "#{name}'s cohort?"
    cohort = gets.strip.downcase
    if ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"].include?(cohort) == false
      puts "Are you sure that's a month? Try again! If you're not sure of the cohort at this time, simply press enter."
      cohort = gets.strip.downcase
      if cohort == ""
        cohort = "Unknown"
      end
    end
    students << {name: name, cohort: cohort.capitalize.to_sym}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
  end
  students
end


students = input_students
print_header
print_names(students)
print_footer(students)
