#
# Othello Game Class
# Author(s): Tyler West
#

class Othello

    # Constants
    WHITE = 'W'
    BLACK = 'B'
    EMPTY = '-'
    TIE = 'T'

    # Creates getter methods for instance variables @size, @turn, @disc,
    # @p1Disc, and @p2Disc
    attr_reader  :size, :turn, :disc, :p1Disc, :p2Disc

    # Constructs and initializes the board of given size
    def initialize(size, startPlayer, discColor)
        # validate arguments
        if size < 4 || size > 8 || size % 2 != 0
            raise ArgumentError.new('Invalid value for board size.')
        end
        if startPlayer < 1 || startPlayer > 2
            raise ArgumentError.new('Invalid value for player number.')
        end
        if discColor != WHITE && discColor != BLACK
            raise ArgumentError.new('Invalid value for disc.');
        end

        # set instance variables
        @board = []
        @size = size
        @turn = startPlayer
        @disc = discColor

        # set two more instance variables @p1Disc and @p2Disc
        if @turn == 1
            @p1Disc = @disc
            @p2Disc = @disc == WHITE ? BLACK : WHITE
        else
            @p2Disc = @disc
            @p1Disc = @disc == WHITE ? BLACK : WHITE;
        end

        # create the grid (as array of arrays)
        @board = Array.new(@size)
        for i in (0...@board.length)
            @board[i] = Array.new(@size)
            @board[i].fill(0)
        end

        # initialize the grid
        initializeBoard()
    end

    # Initializes the board with start configuration of discs
    def initializeBoard()

        # TO DO: COMPLETE THIS METHOD
        maxMid = @size / 2
        minMid = @size / 2 - 1
        for i in 0..size-1
            for j in 0..size-1
                if i == maxMid && j == maxMid
                    @board[i][j] = "B"
                elsif i == minMid && j == minMid
                    @board[i][j] = "B"
                elsif (i == minMid || i == maxMid) && (j == maxMid || j == minMid)
                    @board[i][j] = "W"
                else
                    @board[i][j] = "-";
                end
            end
        end
    end

    # Returns true if placing the disc of current player at row,col is valid;
    # else returns false
    def isValidMove(row, col)
        return isValidMoveForDisc(row, col, @disc)
    end

    #functions for seeing if moves are valid
    #Top
    def canMoveTop(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1

        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end

        if row-c >= min && @board[row-c][col] == notDisc
            while row-c >= min && @board[row-c][col] != "-"
                if @board[row-c][col] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    #Top Right 
    def canMoveTopRight(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1

        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end

        if col+c <= max && row-c >= min && @board[row-c][col+c] == notDisc
            while col+c <= max && row-c >= min && @board[row-c][col+c] != "-"
                if @board[row-c][col+c] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    #Top Left
    def canMoveTopLeft(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1
    
        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end
    
        if col-c >= min && row-c >= min && @board[row-c][col-c] == notDisc
            while col-c >= min && row-c >= min && @board[row-c][col-c] != "-"
                if @board[row-c][col-c] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    #Left
    def canMoveLeft(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1
    
        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end
    
        if col-c >= min && @board[row][col-c] == notDisc
            while col-c >= min && @board[row][col-c] != "-"
                if @board[row][col-c] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    #Right
    def canMoveRight(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1
    
        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end
    
        if col+c <= max && @board[row][col+c] == notDisc
            while col+c <= max && @board[row][col+c] != "-"
                if @board[row][col+c] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    #Bottom
    def canMoveBottom(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1
    
        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end

        if row+c <= max && @board[row+c][col] == notDisc
            while row+c <= max && @board[row+c][col] != "-"
                if @board[row+c][col] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    #Bottom Right
    def canMoveBottomRight(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1
    
        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end

        if row+c <= max && col+c <= max && @board[row+c][col+c] == notDisc
            while row+c <= max && col+c <= max && @board[row+c][col+c] != "-"
                if @board[row+c][col+c] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    #Bottom Left
    def canMoveBottomLeft(row,col,disc)
        max = @size -1
        min = 0
        notDisc = ""
        c = 1
    
        if disc == "B"
            notDisc = "W"
        end
        if disc == "W"
            notDisc = "B"
        end

        if row+c <= max && col-c >= min && @board[row+c][col-c] == notDisc
            while row+c <= max && col-c >= min && @board[row+c][col-c] != "-"
                if @board[row+c][col-c] == disc
                    return true
                end
                c = c + 1
            end
        end
        return false
    end

    # Returns true if placing the specified disc at row,col is valid;
    # else returns false
    def isValidMoveForDisc(row, col, disc)

        # TO DO: COMPLETE THIS PART OF THE METHOD
        if canMoveTop(row,col,disc)
            return true
        end
        if canMoveTopRight(row,col,disc)
            return true
        end
        if canMoveTopLeft(row,col,disc)
            return true
        end
        if canMoveLeft(row,col,disc)
            return true
        end
        if canMoveRight(row,col,disc)
            return true
        end
        if canMoveBottom(row,col,disc)
            return true
        end
        if canMoveBottomLeft(row,col,disc)
            return true
        end
        if canMoveBottomRight(row,col,disc)
            return true
        end

        # DO NOT DELETE - if control reaches this statement, then it is not a valid move
        return false
    end

    # Places the disc of current player at row,col and flips the
    # opponent discs as needed
    def placeDiscAt(row, col)
        if (!isValidMove(row, col))
            return
        end

        # place the current player's disc at row,col
        @board[row][col] = @disc

        # TO DO: COMPLETE THIS PART OF THE METHOD
        c = 1
        notDisc = ""

        if @disc == "B"
            notDisc = "W"
        end
        
        if @disc == "W"
            notDisc = "B"
        end

        #Top
        if canMoveTop(row,col,@disc)
            while @board[row-c][col] == notDisc
                @board[row-c][col] = @disc
                c = c + 1
            end
            c = 1 #reset c
        end
        #Top Right
        if canMoveTopRight(row,col,@disc)
            while @board[row-c][col+c] == notDisc
                @board[row-c][col+c] = @disc
                c = c + 1
            end
            c = 1 #reset c
        end
        #Top Left
        if canMoveTopLeft(row,col,@disc)
            while @board[row-c][col-c] == notDisc
                @board[row-c][col-c] = @disc
                c = c + 1
            end
            c = 1 #reset c
        end
        #Left
        if canMoveLeft(row,col,@disc)
            while @board[row][col-c] == notDisc
                @board[row][col-c] = @disc
                c = c + 1
            end
            c = 1 #reset c
        end
        #Right
        if canMoveRight(row,col,@disc)
            while @board[row][col+c] == notDisc
                @board[row][col+c] = @disc
                c = c + 1
            end
            c = 1 #reset c
        end
        #Bottom Left
        if canMoveBottomLeft(row,col,@disc)
            while @board[row+c][col-c] == notDisc
                @board[row+c][col-c] = @disc
                c = c + 1
            end
            c = 1 #reset c
        end
        #Bottom
        if canMoveBottom(row,col,@disc)
            while @board[row+c][col] == notDisc
                @board[row+c][col] = @disc;
                c = c + 1
            end
            c = 1 #reset c
        end
        #Bottom Right
        if canMoveBottomRight(row,col,@disc)
            while @board[row+c][col+c] == notDisc
                @board[row+c][col+c] = @disc;
                c = c + 1
            end
            c = 1 #reset c
        end

        # DO NOT DELETE - prepares for next turn if game is not over
        if (!isGameOver())
            prepareNextTurn();
        end
    end

    # Sets @turn and @disc instance variables for next player
    def prepareNextTurn()
        if @turn == 1
            @turn = 2
        else
            @turn = 1
        end
        if @disc == WHITE
            @disc = BLACK
        else
            @disc = WHITE
        end
    end

    # Returns true if a valid move for current player is available;
    # else returns false
    def isValidMoveAvailable()
        isValidMoveAvailableForDisc(@disc)
    end

    # Returns true if a valid move for the specified disc is available;
    # else returns false
    def isValidMoveAvailableForDisc(disc)

        # TO DO: COMPLETE THIS PART OF THE METHOD
        for i in 0..@size-1
            for j in 0..@size-1
                if isValidMoveForDisc(i,j,disc) && @board[i][j] == "-"
                    return true
                end
            end
        end

        # DO NOT DELETE - if control reaches this statement, then a valid move is not available
        return false
    end

    # Returns true if the board is fully occupied with discs; else returns false
    def isBoardFull()

        # TO DO: COMPLETE THIS PART OF THE METHOD

        counter = 0
        totalSpaces = @size * @size

        for i in 0..@size-1
            for j in 0..@size-1
                if @board[i][j] != "-"
                    counter = counter + 1
                end
            end
        end

        if counter == totalSpaces
            return true
        end

		return false
    end

    # Returns true if either the board is full or a valid move is not available
    # for either disc
    def isGameOver()
        return isBoardFull() ||
                    (!isValidMoveAvailableForDisc(WHITE) &&
                                !isValidMoveAvailableForDisc(BLACK))
    end

    # If there is a winner, it returns Othello::WHITE or Othello::BLACK.
    # In case of a tie, it returns Othello::TIE
    def checkWinner()

        # TO DO: COMPLETE THIS METHOD
        bCounter = 0
        wCounter = 0

        for i in 0..@size-1
            for j in 0..@size-1
                if @board[i][j] == "B"
                    bCounter = bCounter + 1
                end
                if @board[i][j] == "W"
                    wCounter = wCounter + 1
                end
            end
        end

        if wCounter > bCounter
            return WHITE;
        end
        if bCounter > wCounter
            return BLACK
        end
        if bCounter == wCounter
            return TIE
        end

    end

    # Returns a string representation of the board
    def to_s()
        str = "\n  "
        for i in (0...@size)
            str << (i+1).to_s + ' '
        end
        str << "\n";
        for i in (0...@size)
            str << (i+1).to_s + ' ';
            str << @board[i].join(' ') + "\n";
        end
        return str;
    end
end