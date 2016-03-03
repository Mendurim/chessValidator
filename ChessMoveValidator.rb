require "pry"

# grid = [	["a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8"],
# 			["b1", "b2", "b3", "b4", "b5", "b6", "b7", "b8"],
# 			["c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8"],
# 			["d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8"],
# 			["e1", "e2", "e3", "e4", "e5", "e6", "e7", "e8"],
# 			["f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8"],
# 			["g1", "g2", "g3", "g4", "g5", "g6", "g7", "g8"],
# 			["h1", "h2", "h3", "h4", "h5", "h6", "h7", "h8"]	]

module Translate
	def extract_file_to_array(file)
		text = IO.read(file)
		lines = text.split("\n")
		all_moves = []
		lines.each do |line|
			all_moves.push(string_to_coord(line))
		end
		all_moves
	end
	def string_to_coord(string)
		string_splited = string.split(" ")
		move = []
		string_splited.each do |coord|
			splited_coord = coord.split("")
			move.push([ letter_to_x(splited_coord[0]), splited_coord[1].to_i - 1])
		end
		move
	end
	def letter_to_x(string)
		case string
		when "a"
			string = 0
		when "b"
			string = 1
		when "c"
			string = 2
		when "d"
			string = 3
		when "e"
			string = 4
		when "f"
			string = 5
		when "g"
			string = 6
		when "h"
			string = 7
		else
			puts "letter no translatable"
		end
	end
end

class Piece
	attr_reader :name, :initial_coord
	def initialize(name, initial_coord)
		@name = name
		@initial_coord = initial_coord
	end
end

class Position
	attr_reader :position
	def initialize
		@position = [[], [], [], [], [], [], [], []]
	end

	def initial_grid(pieces_array)
		pieces_array.each do |piece|
		@position[piece.initial_coord[0]][piece.initial_coord[1]] = piece
		end
	end
end


class Validate_moves
	include Translate

	def initialize(position)
		@position = position
	end

	def coord_to_piece(coord)
		piece_name = @position[coord[0]][coord[1]].name
	end

	def check_rook(file)
		all_moves = extract_file_to_array(file)
		validation_array = []
		all_moves.each do |move|
			if move[0][0] == move[1][0] || move[0][1] == move[1][1]
				validation_array.push("LEGAL")
			else
				validation_array.push("ILLEGAL")
			end
		end
		puts validation_array
	end

	def check_bishop(file)
		all_moves = extract_file_to_array(file)
		validation_array = []
		all_moves.each do |move|

		end
		puts validation_array
	end
end



wR1 = Piece.new("wR1", [0, 0])
wN1 = Piece.new("wN1", [1, 0])
wB1 = Piece.new("wB1", [2, 0])
wQ = Piece.new("wQ", [3, 0])
wK = Piece.new("wK", [4, 0])
wB2 = Piece.new("wB2", [5, 0])
wN2 = Piece.new("wN2", [6, 0])
wR2 = Piece.new("wR2", [7, 0])

wP1 = Piece.new("wP1", [0, 1])
wP2 = Piece.new("wP2", [1, 1])
wP3 = Piece.new("wP3", [2, 1])
wP4 = Piece.new("wP4", [3, 1])
wP5 = Piece.new("wP5", [4, 1])
wP6 = Piece.new("wP6", [5, 1])
wP7 = Piece.new("wP7", [6, 1])
wP8 = Piece.new("wP8", [7, 1])

bR1 = Piece.new("bR1", [0, 7])
bN1 = Piece.new("bN1", [1, 7])
bB1 = Piece.new("bB1", [2, 7])
bQ = Piece.new("bQ", [3, 7])
bK = Piece.new("bK", [4, 7])
bB2 = Piece.new("bB2", [5, 7])
bN2 = Piece.new("bN2", [6, 7])
bR2 = Piece.new("bR2", [7, 7])

bP1 = Piece.new("bP1", [0, 6])
bP2 = Piece.new("bP2", [1, 6])
bP3 = Piece.new("bP3", [2, 6])
bP4 = Piece.new("bP4", [3, 6])
bP5 = Piece.new("bP5", [4, 6])
bP6 = Piece.new("bP6", [5, 6])
bP7 = Piece.new("bP7", [6, 6])
bP8 = Piece.new("bP8", [7, 6])

array_pieces = [	wR1, wN1, wB1, wQ, wK, wB2, wN2, wR2, 
					wP1, wP2, wP3, wP4, wP5, wP6, wP7, wP8, 
					bR1, bN1, bB1, bQ, bK, bB2, bN2, bR2, 
					bP1, bP2, bP3, bP4, bP5, bP6, bP7, bP8 ]

move0 = Position.new
move0.initial_grid(array_pieces)

puts move0.position[2][7].name


validate1 = Validate_moves.new(move0.position)
puts validate1.coord_to_piece([2, 7])
