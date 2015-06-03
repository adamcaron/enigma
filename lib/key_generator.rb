class KeyGenerator
  # attr_reader :key
  def initialize(key=new_key)
    @key = key
    # @new_key = new_key
  end
  def key
    @key
  end
  # def new_key
  #   @new_key
  # end

# generates key of 5 random numbers
key = 5.times.map { Random.rand(1..9).to_s }.join.to_i
p key.class
end