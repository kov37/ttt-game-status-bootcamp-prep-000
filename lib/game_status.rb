
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def won?(board)
  for win_combination in WIN_COMBINATIONS do 
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    if (board[win_index_1] == 'X' &&
         board[win_index_2] == 'X' &&
         board[win_index_3] == 'X') || 
         (board[win_index_1] == 'O' &&
          board[win_index_2] == 'O' &&
          board[win_index_3] == 'O')
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all? { |piece| piece == "X" || piece == "O" }
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  full?(board) || won?(board) || draw?(board) ? true : false
end

def winner(board)
  won = won?(board)
  won ? board[won[0]] : nil
end
