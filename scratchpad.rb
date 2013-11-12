





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
