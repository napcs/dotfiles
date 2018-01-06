# load libraries
require 'rubygems'

require 'irb/completion'
require 'irb/ext/save-history'

ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]

# 25 entries in the list
IRB.conf[:SAVE_HISTORY] = 25

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

def history(how_many = 50)
  history_size = Readline::HISTORY.size

  # no lines, get out of here
  puts "No history" and return if history_size == 0

  start_index = 0

  # not enough lines, only show what we have
  if history_size <= how_many
    how_many  = history_size - 1
    end_index = how_many
  else
    end_index = history_size - 1 # -1 to adjust for array offset
    start_index = end_index - how_many
  end

  start_index.upto(end_index) {|i| print_line i}
  nil
end
alias :h  :history

# -2 because -1 is ourself
def history_do(lines = (Readline::HISTORY.size - 2))
  irb_eval lines
  nil
end

alias :h! :history_do

def history_write(filename, lines)
  file = File.open(filename, 'w')

  get_lines(lines).each do |l|
    file << "#{l}\n"
  end

  file.close
end

alias :hw :history_write

private
def get_line(line_number)
  Readline::HISTORY[line_number]
end

def get_lines(lines = [])
  return [get_line(lines)] if lines.is_a? Fixnum

  out = []

  lines = lines.to_a if lines.is_a? Range

  lines.each do |l|
    out << Readline::HISTORY[l]
  end

  return out
end

def print_line(line_number, show_line_numbers = true)
 # print "[%04d] " % line_number if show_line_numbers
  puts get_line(line_number)
end

def irb_eval(lines)
  to_eval = get_lines(lines)

  eval to_eval.join("\n")

  to_eval.each {|l| Readline::HISTORY << l}
end



