require "pry"
require "colorize"

class Questions
  attr_accessor :submitted_questions
  def initialize(q)
    @questions = q
  end
end

class Answers
  attr_accessor :answer
  
  def initialize(answer)
    @answer = answer
  end
end

class MagicEightBall
  def initialize
    @answers = [
      Answers.new("It is certain."),
      Answers.new("It is decidedly so."),
      Answers.new("Without a doubt."),
      Answers.new("Yes - definitely."),
      Answers.new("You may rely on it."),
      Answers.new("As I see it, yes."),
      Answers.new("Most Likely."),
      Answers.new("Outlook good."),
      Answers.new("Yes."),
      Answers.new("Signs point to yes."),
      Answers.new("Reply hazy, try again."),
      Answers.new("Ask again later."),
      Answers.new("Better not tell you now."),
      Answers.new("Cannot predict now."),
      Answers.new("Concentrate and ask again."),
      Answers.new("Don't count on it"),
      Answers.new("My reply is no."),
      Answers.new("My sources say no."),
      Answers.new("Outlook not so good."),
      Answers.new("Very doubtful"),
    ]
    @cloned_answer_list = @answers.clone
    @submitted_questions = []
    main_menu
  end
  puts "Welcome to the Magic Eight Ball application".colorize(:blue)
  puts "Ask the magic eight ball as many questions as you would like.".colorize(:blue)
  puts "Type 'HELP' at any time for a list of function".colorize(:blue)

  def main_menu
    prompt
    question = gets.strip.downcase
    case question
    when "help"
      help_menu
    when "add_answer"
      add_answer
    when "view_all_answers"
      view_all_answers
    when "quit"
      puts "Goodbye".colorize(:blue)
      exit
    when "reset"
      reset_answers_to_start
    when "clear"
      clear_terminal
    else
      submit_question(question)
    end
  end
  
  
end

#HELPER METHODS
def help_menu
  line_width = 75
  print "--To".colorize(:red).ljust(line_width/2)
  print "Type---".colorize(:yellow).rjust(line_width/2)
  puts
  print "---Quit".colorize(:red).ljust(line_width/2)
  print "quit".colorize(:yellow).rjust(line_width/2)
  puts
  print "---Add your own answer".colorize(:red).ljust(line_width/2)
  print "add_answer".colorize(:yellow).rjust(line_width/2)
  puts
  print "---View all available answers".colorize(:red).ljust(line_width/2)
  print "view_all_answers".colorize(:yellow).rjust(line_width/2)
  puts
  print "---Reset answers back to".colorize(:red).ljust(line_width/2)
  print "reset".colorize(:yellow).rjust(line_width/2)
  puts
  print "---Clear the terminal".colorize(:red).ljust(line_width/2)
  print "clear".colorize(:yellow).rjust(line_width/2)
  puts
  puts "---".colorize(:red)
  main_menu
end

def add_answer
  puts "Enter your new answer".colorize(:blue)
  new_answer = gets.strip
  new_arr = []
  @cloned_answer_list.each.with_index do |a, i|
    new_arr << @cloned_answer_list[i].answer.downcase
  end
  if new_arr.include?(new_answer.downcase)
    puts "This answer is already in the eight ball"
    add_answer
  end
  new_answer = Answers.new(new_answer)
  @cloned_answer_list << new_answer
  binding.pry
  main_menu
end

def view_all_answers
  if @cloned_answer_list.length > 20
    @cloned_answer_list.each.with_index do |a, i|
      puts "#{(i + 1)}) #{@cloned_answer_list[i].answer}"
    end
  else
    @answers.each.with_index do |a, i|
      puts "#{(i + 1)}) #{@answers[i].answer}"
  end
  end
  main_menu
end

def submit_question(question)
  @submitted_questions << Questions.new(question)
  thinking
  give_answer
end

def give_answer
  if @cloned_answer_list.length > 20
    puts @cloned_answer_list.sample.answer
  else
    puts @answers.sample.answer
  end
  main_menu
end

def reset_answers_to_start
  @cloned_answer_list = @answers.clone
  main_menu
end

def clear_terminal
  print `clear`
  main_menu
end

# FORMATTING METHODS
def thinking
  x = 0
  rand_time = rand(1..2)
  rand_length = rand(1..10)
  print "thinking".colorize(:red)
  while x < 10
    print "*".colorize(:red) * rand_length
    sleep(rand_time)
    x += 1
  end
  puts
end

def prompt
  print "question> ".colorize(:blue)
end

MagicEightBall.new
