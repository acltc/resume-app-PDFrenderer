class Resume
  attr_reader :id, :dimensions, :sizes, :use, :species

  def initialize(args)
    @id         = args["id"]
    @dimensions = args["dimensions"]
    @sizes      = args["sizes"]
    @use        = args["use"]
    @species    = args["species"]
  end

  def full_name
    "#{id} #{dimensions} #{sizes} #{use} #{species}"
  end

  def self.find(id)
    wood = Unirest.get("http://localhost:3002/lumbers/#{id}.json").body
    Wood.new(wood)
  end

  def self.all
    all_wood_array = Unirest.get("http://localhost:3000/lumbers.json").body["lumber"]
    @wood = []
    all_wood_array.each do |wood_hash|
      @wood << Resume.new(wood_hash)
    end
    @wood
  end
end