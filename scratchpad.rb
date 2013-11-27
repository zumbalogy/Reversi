




def draw_line input
    7.times do |index|
        shift = index + 1
        if $board[row + shift][col - shift] == bad
            $board[row + shift][col - shift] = (shift + 3)
        else
            break
        end
        line_confirm good, bad
    end
end    




#do some proc thing here to yeald to what the first half that if should be

if row != 7
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
        if index == 0
            a = row - shift
            b = col
        elsif index == 1
            a = row
            b = col + shift
        elsif index == 2
            a = row
            b = col -shift
        elsif index == 3
            a = row + shift
            b = col + shift
        elsif index == 4
            a = row - shift
            b = col - shift
        elsif index == 5
            a = row - shift
            b = col + shift
        elsif index == 6
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
