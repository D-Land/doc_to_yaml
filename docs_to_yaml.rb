require "rubygems"
require "google_drive"

#Get login details
puts "Google Drive Username: \n"
username = gets.chomp
puts "Google Drive Password: \n"
password = gets.chomp

# Logs in.
session = GoogleDrive.login(username, password)

done = false

begin

  #Get Spreadsheet Id
  puts "Spreadsheet ID: \n"
  sprdsheed_id = gets.chomp

  # First worksheet of
  # https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
  ws = session.spreadsheet_by_key(sprdsheed_id).worksheets[0]

  #Creates the new file
  puts "New File Name: \n"
  file_name = gets.chomp
  file = File.new(file_name, 'w')

  #Gets row number
  puts "Enter row number: \n"
  row = Integer(gets.chomp)

  #Creates the file
  file.puts("---")

  # Dumps all cells.
  for col in 1..ws.num_cols
    file.puts ws[1, col] + ": " + ws[row, col]
  end

  file.puts("---")

  #Keep going
  puts "Work with another spreadsheet? (y/n): \n"
  if gets.chomp == "n"
    done = true
  end

end until done