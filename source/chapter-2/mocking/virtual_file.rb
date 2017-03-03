class VirtualFile
  def initialize
    @file = StringIO.new
  end

  def write(message)
    @file.write(message)  
  end

  def read
    @file.string
  end
end
