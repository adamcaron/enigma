class Chunker
  attr_reader :groups
  def initialize(groups)
    @groups = []
  end
  def chunks
    @groups = []
    unencrypted_message.read.chars.each_slice(4) do |slice|
      @groups << slice
    end
  end
  def
    @groups.map do |group|
      # group[0].rotate_a
      # group[1].rotate_b
      # group[2].rotate_c
      # group[3].rotate_d
    end
  end
end