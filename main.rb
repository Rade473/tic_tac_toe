# game will be done in this class
class Game
attr_accessor :player1, :player2, :board, :player1_turn, :player2_turn, :choice

  def initialize
    @player1 = ''
    @player2 = ''
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    @player1_turn = true
    @player2_turn = false
    @choice = ''
    @win = false
  end

  def start_game
    #starts the game
    puts "Hello, would you like to play a game of Tic-Tac-Toe?\nPlease reply y for yes and n for no"
    if gets.chomp == 'y'
    player_names()
    display_table()
    player_choice()
    else
    puts 'No game'
    end
  end

  def player_names
    #gets player names
    puts 'Please enter name for Player 1'
    @player1 = gets.chomp
    puts 'Please enter name for Player 2'
    @player2 = gets.chomp
  end
  def display_table
    #displays the game table
    @board.each do |row|
      print "|"
      row.each { |cell| print "#{cell}|"}
      puts "\n"
    end
  end
  def check_win_condition 
    if board[0][0] == board[1][0] && board[1][0] == board[2][0] ||
      board[0][0] == board[0][1] && board[0][1] == board[0][2] ||
      board[0][0] == board[1][1] && board[1][1] == board[2][2] ||
      board[1][0] == board[1][1] && board[1][1] == board[1][2] ||
      board[2][0] == board[2][1] && board[2][1] == board[2][2] ||
      board[0][1] == board[1][1] && board[1][1] == board[2][1] ||
      board[0][2] == board[1][2] && board[1][2] == board[2][2] ||
      board[0][2] == board[1][1] && board[1][1] == board[2][0]
      then @win = true 
        if player2_turn then puts "Congratulations #{player1} you WIN"
        end
        if player1_turn then puts "Congratulations #{player2} you WIN"
        end
        exit
      
      
      else @win = false
      end
    end
  end
  def update_table(x)
    # replaces numbers in the table with player choices
    if player1_turn then
    @board.map! do |rows|
      rows.map! do |e|
        if e == x
        'X'
        else
        e
        end
      end
    end
  elsif player2_turn then
      @board.map! do |rows|
        rows.map! do |e|
          if e == x
          'O'
          else
          e
          end
        end
      end
    end
  end

  def player_choice
    #gets players choices 
    until @win do
      if player1_turn then
      puts "#{player1} please choose with numbers 1-9"
      choice = gets.chomp.to_i
      update_table(choice)
      @player1_turn = false
      @player2_turn = true
      display_table()
      check_win_condition()  
      end
    if player2_turn then
    puts "#{player2} please choose with numbers 1-9"
      choice = gets.chomp.to_i
      update_table(choice)
      @player2_turn = false
      @player1_turn = true
      display_table()
      check_win_condition()
    end
    end
end

game = Game.new
game.start_game

