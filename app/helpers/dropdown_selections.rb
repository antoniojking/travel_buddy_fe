module DropdownSelections
  class << self
    def states 
      CS.states(:us).invert
    end
  end 
end 