

class Path

  def initialize
    @path = get_path
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



end
