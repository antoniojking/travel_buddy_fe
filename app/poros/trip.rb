class Trip
  attr_reader :id,
              :name,
              :start_date,
              :end_date,
              :park_code,
              :park_name,
              :checklists,
              :travel_buddies

  def initialize(data)
    @id =             data[:id]
    @name =           data[:attributes][:name]
    @start_date =     data[:attributes][:start_date]
    @end_date =       data[:attributes][:end_date]
    @park_code =      data[:attributes][:park_code]
    @park_name =      data[:attributes][:park_name]
    @checklists =     data[:attributes][:checklists]
    @accommodations = data[:attributes][:accommodations]
    @travel_buddies = data[:attributes][:users]
    @host =           data[:attributes][:user_id]
  end
end
