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
    @submitted_questions = []
    main_menu
  end
  puts "Welcome to the Magic Eight Ball application"
  puts "Type 'HELP' at any time for a list of functions"
  puts "Ask the magic eight ball a question"

  def main_menu
    prompt
    question = gets.strip.downcase
    case question
    when "help"
      help_menu
    when "add_answer"
      add_answer
    when "view"
      view_all_answers
    when "quit"
      exit
    when "reset"
      
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
  print "---Quit =".colorize(:red).ljust(line_width/2)
  print "quit".colorize(:yellow).rjust(line_width/2)
  puts
  print "---Add your own answer =".colorize(:red).ljust(line_width/2)
  print "add_answer".colorize(:yellow).rjust(line_width/2)
  puts
  print "---View all available answers =".colorize(:red).ljust(line_width/2)
  print "view_all_answers".colorize(:yellow).rjust(line_width/2)
  puts
  print "---Reset answers back to  =".colorize(:red).ljust(line_width/2)
  print "reset".colorize(:yellow).rjust(line_width/2)
  puts
  puts "---".colorize(:red)
  main_menu
end

def add_answer
  puts "this function isn't done yet"
  main_menu
end

def view_all_answers
  @answers.each.with_index do |a, i|
    puts "#{(i + 1)}) #{@answers[i].answer}"
  end
  main_menu
end

def submit_question(question)
  @submitted_questions << Questions.new(question)
  # thinking
  give_answer
end

def give_answer
  puts @answers[rand(0..(@answers.length - 1))].answer
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
