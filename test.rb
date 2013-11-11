7.times do |index|
    shift = index + 1
    if $board[row + shift][col - shift] == bad
        $board[row + shift][col - shift] = (shift + 3)
    else
        break
    end
    line_confirm good, bad
end



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