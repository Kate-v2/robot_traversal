

class Path

  def initialize
    @path = get_path
    @current_direction = 'up'

    @movement = {up: 0, left: 0, right: 0, down: 0 }

    @direction = ['up', 'right', 'down', 'left']

  end

  def get_path
    path = prompt_user
    validate_path( path )
  end

  def prompt_user(again = false)
    (puts "Sorry, only character G, L, R") if again
    puts "Please enter a path"
    path = gets.chomp
  end

  def validate_path(path)
    allowed = [ 'g', 'l', 'r' ]
    path    = characters(path.downcase)
    valids  = path.map { |c| allowed.include?(c) }
    valid   = valids.all? { |v| v == true }
    valid ? path : prompt_user(true)
  end

  def characters(path)
    path.split('')
  end

  def move
    @path.each { |d|
      move_forward if d == 'g'
      move_left    if d == 'l'
      move_right   if d == 'r'
    }

    vert = @movement[:up]   - @movement[:down]
    hor  = @movement[:left] - @movement[:right]

    puts (vert + hor == 0) ? true : false
  end

  def move_left
    index = @direction.find_index(@current_direction)
    @current_direction = @direction[index - 1]
    @movement[@current_direction.to_sym] += 1
  end

  def move_forward
    # index = @direction.find_index(@current_direction)
    # @current_direction = @direction[index - 1]
    @movement[@current_direction.to_sym] += 1
  end

  def move_right
    index = @direction.find_index(@current_direction)
    @current_direction = @direction[index + 1]
    @movement[@current_direction.to_sym] += 1
  end




  #
  # def move_forward
  #   @movement[@current_direction.to_sym] += 1
  # end
  #
  # def move_left
  #   @current_direction = 'left'
  #   @movement[@current_direction.to_sym] += 1
  # end


end
