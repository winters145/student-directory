def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # if name is not left empty, repeat the following code:
  while !name.empty? do
      # add the given student hash to the array
    students << {name: name, cohort: :january}
    puts "We now have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end    
  # return the array of students
  students
end

def print_header
 puts "The students of Villian Academy"
 puts "-----------"
end

def print(students)
  count = 0
  while count < students.length do
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end  

students = input_students
print_header
print(students)
print_footer(students)