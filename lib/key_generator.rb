class KeyGenerator
  attr_reader :key
  def initialize(key=new_key)
    @key = key
    # @new_key = new_key
  end
  def key
    @key
  end
  def new_key
    # .to_i does weird things to 0
    5.times.map { Random.rand(1..9).to_s }.join.to_i
  end
end