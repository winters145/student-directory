def input_students
  students = []
  puts "To finish, hit return twice"
  
  # if name is not left empty, repeat the following code:
  while true do
    puts "Please enter the students name"
    # Get the first name
    name = gets.chomp
    if name.empty?
      break
    end 
    puts "Please enter the students age"
    age = gets.chomp
    # add the given student hash to the array
    students << {name: name, age: age, cohort: :january}
    puts "We now have #{students.count} students"
    # get another name from the user
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
    puts "#{students[count][:name]}, aged #{students[count][:age]} (#{students[count][:cohort].capitalize} cohort)"
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