class Park
  attr_reader :id,
              :url,
              :fullName,
              :description,
              :images

  def initialize(attributes)
    @id           = attributes[:id]
    @fullName     = attributes[:fullName]
    @description  = attributes[:description]
    @url          = attributes[:url]
    @images       = attributes[:images]
  end
end
