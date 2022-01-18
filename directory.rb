 @students = []
def input_students
  puts "To finish, hit return twice"
  # if name is not left empty, repeat the following code:
  while true do
    puts "Please enter the students name"
    # Get the first name
    name = STDIN.gets.strip
    if name.empty?
      break
    end 
    
    puts "Please enter the students age"
    age = STDIN.gets.strip
      age = "N/A" if age.empty?
    puts "Please enter their cohort"
    cohort = STDIN.gets.strip.downcase
      until cohort == "january" || cohort =="february" || cohort =="march" || cohort =="april" || cohort =="may" || cohort =="june" || cohort =="july" || cohort =="august" || cohort =="september" || cohort =="october" || cohort =="november" || cohort =="december" || cohort ==""
        puts "Cohort invalid; please enter a month and check that the spelling is correct"
        cohort = STDIN.gets.strip.downcase
      end
    if cohort == ""
      cohort = :january
    end
    cohort.to_sym
    # add the given student hash to the array
    @students << {name: name, age: age, cohort: cohort}
    if @students.count == 1
      puts "We now have 1 student"
    else  
      puts "We now have #{@students.count} students"
    end
  end    
end

def print_header
 puts "The students of Villian Academy"
 puts "-----------".center(27)
end

def print_students_list
  count = 0
  while count < @students.length do
    puts "#{@students[count][:name]}, aged #{@students[count][:age]} (#{@students[count][:cohort].capitalize} cohort)"
    count += 1
  end
end

def print_footer
  if @students.count == 1
    puts "Overall we have 1 great student"
  elsif @students.empty?
    puts "We are yet to take on any students"
  else  
    puts "Overall we have #{@students.count} great students"
  end
  puts "-----------".center(27)
end 

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end  
end  

def print_menu
  puts "1. Input the students"
  puts "2. View a list of the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
        load_students
      when "9"
        exit
      else
        puts "I don't know what you meant, please try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end  

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end 
  file.close
end

def try_load_students
  filename = ARGV.first # the first argument from the commandline
  return if filename.nil? # gets us out of the method if the file name isn't given
  if File.exists?(filename) # if the filename given exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit #quits the program
  end 
end  

try_load_students
interactive_menu