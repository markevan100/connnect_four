class Board

  attr_reader :layout
  def initialize
    @layout = ["1234567", ".......", ".......", ".......", ".......", ".......", "......."]
  end

  def player1_turn(guess)
    if layout[6][guess - 1] == "."
      @layout[6][guess - 1] = "x"
    elsif layout[5][guess - 1] == "."
      @layout[5][guess - 1] = "x"
    elsif layout[4][guess - 1] == "."
      @layout[4][guess - 1] = "x"
    elsif layout[3][guess - 1] == "."
      @layout[3][guess - 1] = "x"
    elsif layout[2][guess - 1] == "."
      @layout[2][guess - 1] = "x"
    elsif layout[1][guess - 1] == "."
      @layout[1][guess - 1] = "x"
    else
      puts "That column is full."
    end
  end

  def comp_turn(guess)
    if layout[6][guess - 1] == "."
      @layout[6][guess - 1] = "o"
    elsif layout[5][guess - 1] == "."
      @layout[5][guess - 1] = "o"
    elsif layout[4][guess - 1] == "."
      @layout[4][guess - 1] = "o"
    elsif layout[3][guess - 1] == "."
      @layout[3][guess - 1] = "o"
    elsif layout[2][guess - 1] == "."
      @layout[2][guess - 1] = "o"
    elsif layout[1][guess - 1] == "."
      @layout[1][guess - 1] = "o"
    else
      "That column is full."
    end
  end

  def win?
    vert1 = layout[1][0] + layout[2][0] + layout[3][0] + layout[4][0] + layout[5][0] + layout[6][0]
    vert2 = layout[1][1] + layout[2][1] + layout[3][1] + layout[4][1] + layout[5][1] + layout[6][1]
    vert3 = layout[1][2] + layout[2][2] + layout[3][2] + layout[4][2] + layout[5][2] + layout[6][2]
    vert4 = layout[1][3] + layout[2][3] + layout[3][3] + layout[4][3] + layout[5][3] + layout[6][3]
    vert5 = layout[1][4] + layout[2][4] + layout[3][4] + layout[4][4] + layout[5][4] + layout[6][4]
    vert6 = layout[1][5] + layout[2][5] + layout[3][5] + layout[4][5] + layout[5][5] + layout[6][5]
    vert7 = layout[1][6] + layout[2][6] + layout[3][6] + layout[4][6] + layout[5][6] + layout[6][6]
    verts = [vert1, vert2, vert3, vert4, vert5, vert6, vert7]
    ver = verts.any? { |s| s.include?("xxxx")}
    vert = verts.any? { |s| s.include?("oooo")}

    diag1 = layout[4][0] + layout[3][1] + layout[2][2] + layout[1][3]
    diag2 = layout[5][0] + layout[4][1] + layout[3][2] + layout[2][3] + layout[1][4]
    diag3 = layout[6][0] + layout[5][1] + layout[4][2] + layout[3][3] + layout[2][4] + layout[1][5]
    diag4 = layout[6][1] + layout[5][2] + layout[4][3] + layout[3][4] + layout[2][5] + layout[1][6]
    diag5 = layout[6][2] + layout[5][3] + layout[4][4] + layout[3][5] + layout[2][6]
    diag6 = layout[6][3] + layout[5][4] + layout[4][5] + layout[3][6]
    diag7 = layout[6][3] + layout[5][2] + layout[4][1] + layout[3][0]
    diag8 = layout[6][4] + layout[5][3] + layout[4][2] + layout[3][1] + layout[2][0]
    diag9 = layout[6][5] + layout[5][4] + layout[4][3] + layout[3][2] + layout[2][1] + layout[1][0]
    diag10 = layout[6][6] + layout[5][5] + layout[4][4] + layout[3][3] + layout[2][2] + layout[1][1]
    diag11 = layout[5][6] + layout[4][5] + layout[3][4] + layout[2][3] + layout[1][2]
    diag12 = layout[4][6] + layout[3][5] + layout[2][4] + layout[1][3]
    diags = [diag1, diag2, diag3, diag4, diag5, diag6, diag7, diag8, diag9, diag10, diag11, diag12]
    dia = diags.any? { |s| s.include?("xxxx")}
    diat = diags.any? { |s| s.include?("oooo")}
    hor = layout.any? { |s| s.include?("xxxx")}
    hort = layout.any? { |s| s.include?("oooo")}
    if hor
      true
    elsif hort
      true
    elsif ver
      true
    elsif vert
      true
    elsif dia
      true
    elsif diat
      true
    end
  end
end
