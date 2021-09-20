class Park
  attr_reader :id,
              :name,
              :description,
              :website,
              :state,
              :image

  def initialize(attributes)
    @id           = attributes[:id]
    @name         = attributes[:fullName]
    @description  = attributes[:description]
    @website      = attributes[:url]
    @state        = attributes[:states]
    @image        = attributes[:images][0][:url]
  end
end
