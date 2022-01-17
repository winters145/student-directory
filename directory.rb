# All students added into an Array
students = [
    {name: "Dr. Hannibal Lecter", cohort: :january},
    {name: "Darth Vader", cohort: :january},
    {name: "Nurse Ratched", cohort: :january},
    {name: "Michael Corleone", cohort: :january},
    {name: "Alex DeLarge", cohort: :january},
    {name: "The Wicked Witch of the West", cohort: :january},
    {name: "Terminator", cohort: :january},
    {name: "Freddy Krueger", cohort: :january},
    {name: "The Joker", cohort: :january},
    {name: "Joffrey Baratheon", cohort: :january},
    {name: "Norman Bates", cohort: :january}
    ]

def print_header
 puts "The students of Villian Academy"
 puts "-----------"
end

def print(students)
  students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end  

print_header
print(students)
print_footer(students)