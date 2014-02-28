$board = [ [-1,-1,-1,-1,-1,-1,-1,-1],
           [-1,-1,-1,-1,-1,-1,-1,-1],
           [-1,-1,-1,-1,-1,-1,-1,-1],
           [-1,-1,-1, 1, 0,-1,-1,-1],
           [-1,-1,-1, 0, 1,-1,-1,-1],
           [-1,-1,-1,-1,-1,-1,-1,-1],
           [-1,-1,-1,-1,-1,-1,-1,-1],
           [-1,-1,-1,-1,-1,-1,-1,-1], 
           [] ] #empty set prevents running off board error

def display
    puts
    puts "     1 2 3 4 5 6 7 8"
    puts
    $board.each_with_index do |line, index|
        unless line == []
            print index + 1
            print "    "
            line.each do |cell|
                if cell == -1
                    print "- "
                elsif cell == 0
                    print "X "
                else
                    print "O "
                end
            end
            print "   "
            print index + 1
            puts
        end
    end
    puts
    puts "     1 2 3 4 5 6 7 8"
    puts
end

def line_confirm good, bad
    top_row_loc = 0
    top_cell_loc = 0
    @top_val = 0
    @second_cell_loc = 0
    @second_row_loc = 0

    $board.each_with_index do |row, row_num|
        row.each_with_index do |cell, cell_num|
            if cell > @top_val
                @top_val = cell
                top_row_loc = row_num
                top_cell_loc = cell_num
            end
        end
        row.each_with_index do |cell, cell_num|
            if cell == @top_val - 1
                @second_cell_loc = cell_num
                @second_row_loc = row_num
            end
        end
    end

    x_axis = top_cell_loc - @second_cell_loc
    y_axis = top_row_loc - @second_row_loc
    if x_axis == -1 #second cell is to the right
        if y_axis == -1 && $board[top_row_loc - 1][top_cell_loc - 1] == good
            switcher good
        elsif y_axis == 0 && $board[top_row_loc][top_cell_loc - 1] == good
            switcher good
        elsif y_axis == 1 && $board[top_row_loc + 1][top_cell_loc - 1] == good
            switcher good
        end
    elsif x_axis == 0
        if y_axis == -1 && $board[top_row_loc - 1][top_cell_loc] == good
            switcher good
        elsif y_axis == 1 && $board[top_row_loc + 1][top_cell_loc] == good
            switcher good
        end
    elsif x_axis == 1 #second cell to the left
        if y_axis == -1 && $board[top_row_loc - 1][top_cell_loc + 1] == good
            switcher good
        elsif y_axis == 0 && $board[top_row_loc][top_cell_loc + 1] == good
            switcher good
        elsif y_axis == 1 && $board[top_row_loc + 1][top_cell_loc + 1] == good
            switcher good
        end
    end

    $board.each_with_index do |row, row_num|
        row.each_with_index do |cell, cell_num|
            $board[row_num][cell_num] = bad if cell > 3
        end
    end
end

def switcher good
    $board.each_with_index do |row, row_num|
        row.each_with_index do |cell, cell_num|
            $board[row_num][cell_num] = good if cell > 3
        end
    end
end



def move good, bad, input
    a = input.split
    row = a[0].to_i - 1
    col = a[1].to_i - 1

    if row < 10 && col < 10 && $board[row][col] == -1
        $board[row][col] = 3
                        
        unless row == 7
            7.times do |index|
                shift = index + 1
                if $board[row + shift][col] == bad
                    $board[row + shift][col] = (shift + 3)
                else
                    break
                end
            end
            line_confirm good, bad
        end

        7.times do |index|
            7.times do |index2|
                shift = index2 + 1
                case index
                when 0
                    a = row - shift
                    b = col
                when 1
                    a = row
                    b = col + shift
                when 2
                    a = row
                    b = col -shift
                when 3
                    a = row + shift
                    b = col + shift
                when 4
                    a = row - shift
                    b = col - shift
                when 5
                    a = row - shift
                    b = col + shift
                when 6
                    a = row + shift
                    b = col - shift
                end
                if $board[a][b] == bad
                    $board[a][b] = (shift + 3)
                else
                    break
                end
                line_confirm good, bad
            end       
        end


        $board.each_with_index do |row, row_num|
            row.each_with_index do |cell, cell_num|
                $board[row_num][cell_num] = good if cell == 3
            end
        end
    end
end

def eval
    @free_space = 0
    @player_1_score = 0
    @player_2_score = 0
    $board.each do |row|
        row.each do |cell|
            @free_space += 1 unless cell == -1
            if cell == 0
                @player_1_score += 1
            elsif cell == 1
                @player_2_score += 1
            end
        end
    end
end

def turn good, bad, player
    board_save = []
    board_sum = 0
    $board.each do |row|
        rows = []
        row.each do |cell|
            rows << cell
            if cell == good
                board_sum += 1
            end
        end
        board_save << rows
    end

    display

    print "Player #{player} (Row, Col): "
    move good, bad, gets.chomp
    eval

    board_sum2 = 0
    $board.each do |row|
        row.each do |cell|    
            board_sum2 += 1 if cell == good
        end
    end
    
    if board_sum2 - board_sum < 2 && 
            @player_1_score != 0 && 
            @player_2_score != 0
        $board = board_save
        puts " *** Invlalid Move. Please Try Again. ***"
        turn good, bad, player
    elsif @player_1_score == 0 || @player_2_score == 0
        puts "Game Over"
        display
        puts "Player 1 score: #{@player_1_score}"
        puts "Player 2 score: #{@player_2_score}"
    end
end

def play
    @free_space = 0
    until @free_space == 64
        turn 0, 1, "X"
        turn 1, 0, "O"
    end
    display
    puts "Player 1 score: #{@player_1_score}"
    puts "Player 2 score: #{@player_2_score}"
end

play

#  what if no moves avaliable, but still pieces?
#  i could scan all possible moves and see, then say?
#  what happens in real reversi if this the case?