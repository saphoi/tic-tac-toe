class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @columns = ['A', 'B', 'C']
    @rows = ['1', '2', '3']
    @players = ['X', 'O']
    @scores = { 'X' => 0, 'O' => 0 }
    @turn = 0
  end

  def play
    loop do
      loop do
        display_board
        player = @players[@turn % 2]
        puts "Player #{player}, enter your move (e.g., A1):"
        move = gets.chomp.upcase

        if valid_move?(move)
          row, col = parse_move(move)
          @board[row][col] = player
          if winner?(player)
            display_board
            puts "Player #{player} wins!"
            @scores[player] += 1
            break
          elsif draw?
            display_board
            puts "VELHA (draw)!"
            break
          else
            @turn += 1
          end
        else
          puts "Invalid move. Try again."
        end
      end

      display_scores
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break unless answer == 'y'

      reset_board
    end

    puts "Final scores:"
    display_scores
    puts "Thanks for playing!"
  end

  private

  def display_board
    puts "   A   B   C"
    @board.each_with_index do |row, i|
      row_display = row.map { |cell| " #{cell} " }.join('|')
      puts "#{i + 1}#{row_display}"
      puts "  ---|---|---" unless i == 2
    end
  end

  def display_scores
    puts "Scores:"
    @scores.each { |player, score| puts "Player #{player}: #{score}" }
  end

  def reset_board
    @board = Array.new(3) { Array.new(3, ' ') }
    @turn = 0
  end

  def valid_move?(move)
    return false unless move.match?(/^[ABC][123]$/)
    row, col = parse_move(move)
    @board[row][col] == ' '
  end

  def parse_move(move)
    col = @columns.index(move[0])
    row = @rows.index(move[1])
    [row, col]
  end

  def winner?(player)
    # Check rows and columns
    3.times do |i|
      return true if @board[i].all? { |cell| cell == player }          # row
      return true if @board.all? { |row| row[i] == player }            # column
    end
    # Check diagonals
    return true if (0..2).all? { |i| @board[i][i] == player }
    return true if (0..2).all? { |i| @board[i][2 - i] == player }
    false
  end

  def draw?
    empty_cells = @board.flatten.count(' ')
    return false if empty_cells > 1

    if empty_cells == 1
      # Check if either player could win with the last move
      @players.each do |player|
        (0..2).each do |row|
          (0..2).each do |col|
            if @board[row][col] == ' '
              @board[row][col] = player
              if winner?(player)
                @board[row][col] = ' '
                return false
              end
              @board[row][col] = ' '
            end
          end
        end
      end
    end
    true
  end
end

# Run the game
TicTacToe.new.play