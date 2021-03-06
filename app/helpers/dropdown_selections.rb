module DropdownSelections
  class << self
    def states
      CS.states(:us).invert
    end

    def activity
      [
        "Arts and Culture",
        "Astronomy",
        "Auto and ATV",
        "Biking",
        "Boating",
        "Camping",
        "Canyoneering",
        "Caving",
        "Climbing",
        "Compass and GPS",
        "Dog Sledding",
        "Fishing",
        "Flying",
        "Food",
        "Golfing",
        "Guided Tours",
        "Hands-On",
        "Hiking",
        "Horse Trekking",
        "Hunting and Gathering",
        "Ice Skating",
        "Junior Ranger Program",
        "Living History",
        "Museum Exhibits",
        "Paddling",
        "Park Film",
        "Playground",
        "SCUBA Diving",
        "Shopping",
        "Skiing",
        "Snorkeling",
        "Snow Play",
        "Snowmobiling",
        "Snowshoeing",
        "Surfing",
        "Swimming",
        "Team Sports",
        "Tubing",
        "Water Skiing",
        "Wildlife Watching"
      ]
    end
  end
end
