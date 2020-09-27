def geo
  User.all.each do |usr|
    unless usr.geocoded?
      puts "#{usr.id}: #{usr.address}"
      geoObj = Geocoder.search(usr.address)
      unless geoObj.nil? || geoObj.count.zero?
        usr.latitude = geoObj[0].data["lat"]
        usr.longitude = geoObj[0].data["lon"]
      end
    end
  end
end
