desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  u = User.new
  u.email = "jonathon.zuniga@gmail.com"
  u.password = "password"
  u.first_name = "Jonathon"
  u.last_name = "Zuniga"
  u.save
  p u.errors.full_messages

  d = Device.new
  d.device = "Espresso"
  d.save
  p d.errors.full_messages

  d2 = Device.new
  d2.device = "V60"
  d2.save
  p d2.errors.full_messages

  r = Roaster.new
  r.name = "Boomtown Coffee"
  r.save
  p r.errors.full_messages

  b = Bean.new
  b.name = "Shantawene"
  b.roaster_id = r.id
  b.country_of_origin = "Ethiopia"
  b.roast_date = "03/01/2022"
  b.process = "Natural"
  b.roast_level = "Light"
  b.save
  p b.errors.full_messages

  r2 = Roaster.new
  r2.name = "Intelligentsia"
  r2.save
  p r2.errors.full_messages

  b2 = Bean.new
  b2.name = "El Bado"
  b2.roaster_id = r2.id
  b2.country_of_origin = "Colombia"
  b2.roast_date = "03/06/2022"
  b2.process = "Washed"
  b2.roast_level = "Medium"
  b2.save
  p b2.errors.full_messages


end
