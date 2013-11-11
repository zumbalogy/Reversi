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
        if line != []
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
    second_cell_loc = 0
    second_row_loc = 0

    $board.each_with_index do |row, row_num|
        row.each_with_index do |cell, cell_num|
            if cell > @top_val
                @top_val = cell
                top_row_loc = row_num
                top_cell_loc = cell_num
            end
        end
    end

    $board.each_with_index do |row, row_num|
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
        if y_axis == -1
            if $board[top_row_loc - 1][top_cell_loc - 1] == good
                switcher good
            end
        elsif y_axis == 0
            if $board[top_row_loc][top_cell_loc - 1] == good
                switcher good
            end
        elsif y_axis == 1
            if $board[top_row_loc + 1][top_cell_loc - 1] == good
                switcher good
            end
        end

    elsif x_axis == 0
        if y_axis == -1
            if $board[top_row_loc - 1][top_cell_loc] == good
                switcher good
            end
        elsif y_axis == 1
            if $board[top_row_loc + 1][top_cell_loc] == good
                switcher good
            end
        end

    elsif x_axis == 1 #second cell to the left
        if y_axis == -1
            if $board[top_row_loc - 1][top_cell_loc + 1] == good
                switcher good
            end
        elsif y_axis == 0
            if $board[top_row_loc][top_cell_loc + 1] == good
                switcher good
            end
        elsif y_axis == 1
            if $board[top_row_loc + 1][top_cell_loc + 1] == good
                switcher good
            end
        end
    end

    $board.each_with_index do |row, row_num|
        row.each_with_index do |cell, cell_num|
            if cell > 3
                $board[row_num][cell_num] = bad
            end
        end
    end
end

def switcher good
    $board.each_with_index do |row, row_num|
        row.each_with_index do |cell, cell_num|
            if cell > 3
                $board[row_num][cell_num] = good
            end
        end
    end
end

def move good, bad, input
    a = input.split
    row = a[0].to_i - 1
    col = a[1].to_i - 1

    if row < 10 && col < 10
        if $board[row][col] == -1
            $board[row][col] = 3

            if row != 7
                if $board[row + 1][col] == bad
                    $board[row + 1][col] = 4
                    if $board[row + 2][col] == bad
                        $board[row + 2][col] = 5
                        if $board[row + 3][col] == bad
                            $board[row + 3][col] = 6
                            if $board[row + 4][col] == bad
                                $board[row + 4][col] = 7
                                if $board[row + 5][col] == bad
                                    $board[row + 5][col] = 8
                                    if $board[row + 6][col] == bad
                                        $board[row + 6][col] = 9
                                        if $board[row + 7][col] == bad
                                            $board[row + 7][col] = 10
                                        end
                                    end
                                end
                            end
                        end
                    end
                line_confirm good, bad
                end
            end

            if $board[row - 1][col] == bad
                $board[row - 1][col] = 4
                if $board[row - 2][col] == bad
                    $board[row - 2][col] = 5
                    if $board[row - 3][col] == bad
                        $board[row - 3][col] = 6
                        if $board[row - 4][col] == bad
                            $board[row - 4][col] = 7
                            if $board[row - 5][col] == bad
                                $board[row - 5][col] = 8
                                if $board[row - 6][col] == bad
                                    $board[row - 6][col] = 9
                                    if $board[row - 7][col] == bad
                                        $board[row - 7][col] = 10
                                    end
                                end
                            end
                        end
                    end
                end
            line_confirm good, bad
            end

            if $board[row][col + 1] == bad
                $board[row][col + 1] = 4
                if $board[row][col + 2] == bad
                    $board[row][col + 2] = 5
                    if $board[row][col + 3] == bad
                        $board[row][col + 3] = 6
                        if $board[row][col + 4] == bad
                            $board[row][col + 4] = 7
                            if $board[row][col + 5] == bad
                                $board[row][col + 5] = 8
                                if $board[row][col + 6] == bad
                                    $board[row][col + 6] = 9
                                    if $board[row][col + 7] == bad
                                        $board[row][col + 7] = 10
                                    end
                                end
                            end
                        end
                    end
                end
            line_confirm good, bad
            end

            if $board[row][col - 1] == bad
                $board[row][col - 1] = 4
                if $board[row][col - 2] == bad
                    $board[row][col - 2] = 5
                    if $board[row][col - 3] == bad
                        $board[row][col - 3] = 6
                        if $board[row][col - 4] == bad
                            $board[row][col - 4] = 7
                            if $board[row][col - 5] == bad
                                $board[row][col - 5] = 8
                                if $board[row][col - 6] == bad
                                    $board[row][col - 6] = 9
                                    if $board[row][col - 7] == bad
                                        $board[row][col - 7] = 10
                                    end
                                end
                            end
                        end
                    end
                end
            line_confirm good, bad
            end

            if row != 7
                if $board[row + 1][col + 1] == bad
                    $board[row + 1][col + 1] = 4
                    if row != 6
                        if $board[row + 2][col + 2] == bad
                            $board[row + 2][col + 2] = 5
                            if $board[row + 3][col + 3] == bad
                                $board[row + 3][col + 3] = 6
                                if $board[row + 4][col + 4] == bad
                                    $board[row + 4][col + 4] = 7
                                    if $board[row + 5][col + 5] == bad
                                        $board[row + 5][col + 5] = 8
                                        if $board[row + 6][col + 6] == bad
                                            $board[row + 6][col + 6] = 9
                                            if $board[row + 7][col + 7] == bad
                                                $board[row + 7][col + 7] = 10
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                line_confirm good, bad
                end
            end

            if $board[row - 1][col - 1] == bad
                $board[row - 1][col - 1] = 4
                if $board[row - 2][col - 2] == bad
                    $board[row - 2][col - 2] = 5
                    if $board[row - 3][col - 3] == bad
                        $board[row - 3][col - 3] = 6
                        if $board[row - 4][col - 4] == bad
                            $board[row - 4][col - 4] = 7
                            if $board[row - 5][col - 5] == bad
                                $board[row - 5][col - 5] = 8
                                if $board[row - 6][col - 6] == bad
                                    $board[row - 6][col - 6] = 9
                                    if $board[row - 7][col - 7] == bad
                                        $board[row - 7][col - 7] = 10
                                    end
                                end
                            end
                        end
                    end
                end
            line_confirm good, bad
            end


            if $board[row - 1][col + 1] == bad
                $board[row - 1][col + 1] = 4
                if $board[row - 2][col + 2] == bad
                    $board[row - 2][col + 2] = 5
                    if $board[row - 3][col + 3] == bad
                        $board[row - 3][col + 3] = 6
                        if $board[row - 4][col + 4] == bad
                            $board[row - 4][col + 4] = 7
                            if $board[row - 5][col + 5] == bad
                                $board[row - 5][col + 5] = 8
                                if $board[row - 6][col + 6] == bad
                                    $board[row - 6][col + 6] = 9
                                    if $board[row - 7][col + 7] == bad
                                        $board[row - 7][col + 7] = 10
                                    end
                                end
                            end
                        end
                    end
                end
            line_confirm good, bad
            end

            if row != 7 #&& col != 7
                if $board[row + 1][col - 1] == bad
                    $board[row + 1][col - 1] = 4
                    if row != 6
                        if $board[row + 2][col - 2] == bad
                            $board[row + 2][col - 2] = 5
                            if $board[row + 3][col - 3] == bad
                                $board[row + 3][col - 3] = 6
                                if $board[row + 4][col - 4] == bad
                                    $board[row + 4][col - 4] = 7
                                    if $board[row + 5][col - 5] == bad
                                        $board[row + 5][col - 5] = 8
                                        if $board[row + 6][col - 6] == bad
                                            $board[row + 6][col - 6] = 9
                                            if $board[row + 7][col - 7] == bad
                                                $board[row + 7][col - 7] = 10
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                line_confirm good, bad
                end
            end

            $board.each_with_index do |row, row_num|
                row.each_with_index do |cell, cell_num|
                    if cell == 3
                        $board[row_num][cell_num] = good
                    end
                end
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
            if cell != -1
                @free_space += 1
            end
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
            if cell == good
                board_sum2 += 1
            end
        end
    end
    
    if board_sum2 - board_sum < 2 \
    && @player_1_score != 0 && @player_2_score != 0
        $board = board_save
        puts " *** Invlalid Move. Please Try Again. ***"
        turn good, bad, player
    else
        if @player_1_score == 0 || @player_2_score == 0
            puts "Game Over"
            display
            puts "Player 1 score: #{@player_1_score}"
            puts "Player 2 score: #{@player_2_score}"
        end
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