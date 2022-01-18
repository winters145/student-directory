def input_students
  students = []
  puts "To finish, hit return twice"
  
  # if name is not left empty, repeat the following code:
  while true do
    puts "Please enter the students name"
    # Get the first name
    name = gets.strip
    if name.empty?
      break
    end 
    
    puts "Please enter the students age"
    age = gets.strip
    puts "Please enter their cohort"
    cohort = gets.strip.downcase
      until cohort == "january" || cohort =="february" || cohort =="march" || cohort =="april" || cohort =="may" || cohort =="june" || cohort =="july" || cohort =="august" || cohort =="september" || cohort =="october" || cohort =="november" || cohort =="december" || cohort ==""
        puts "Cohort invalid; please enter a month and check that the spelling is correct"
        cohort = gets.strip.downcase
      end
    if cohort == ""
      cohort = :january
    end
    cohort.to_sym
    # add the given student hash to the array
    students << {name: name, age: age, cohort: cohort}
    if students.count == 1
      puts "We now have 1 student"
    else  
      puts "We now have #{students.count} students"
    end
  end    
  # return the array of students
  students
end

def print_header
 puts "The students of Villian Academy"
 puts "-----------".center(27)
end

def print(students)
  count = 0
  while count < students.length do
    puts "#{students[count][:name]}, aged #{students[count][:age]} (#{students[count][:cohort].capitalize} cohort)"
    count += 1
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall we have 1 great student"
  else  
    puts "Overall we have #{names.count} great students"
  end
end 


students = input_students
print_header
print(students)
print_footer(students)