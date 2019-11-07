museums_list = {
    "Museume of Modern Art" => {
      :location => "New York, NY"
    },
    "Metropolitan Museum of Art" => {
      :location => "New York, NY"
    },
    "Louvre Museum" => {
      :location => "Paris, France"
    },
    "Prado Museume" => {
      :location => "Madrid, Spain"
    },
    "High Museum" => {
      :location => "Atlanta, GA"
    },
    "The Dali (Salvador Dali Museum)" => {
      :location => "St. Petersburg, FL"
    },
    "La Luz de Jesus" => {
      :location => "Los Angeles, CA"
    },
    "Los Angeles County Museum of Art" => {
      :location => "Los Angeles, CA"
    },
    "The Broad" => {
      :location => "Los Angeles, CA"
    },
    "Seattle Art Museum" => {
      :location => "Seattle, WA"
  }
}

museums_list.each do |name, museum_hash|
  p = Museum.new
  p.name = name
  museum_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end