# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Artur', role: 'admin', email: 'art@gmail.com', password: 123456)
second_user = User.create(name: 'Pedro', role: 'admin', email: 'pedro@gmail.com', password: 123456)

first_car = Car.create(model: 'Lamborgini', year: '2019', price: 2750, image: 'https://wallup.net/wp-content/uploads/2019/09/848518-2010-lamborghini-sesto-elemento-concept-supercar-748x561.jpg')
second_car = Car.create(model: 'Mercedes', year: '2021', price: 1750, image: 'https://carsguide-res.cloudinary.com/image/upload/f_auto%2Cfl_lossy%2Cq_auto%2Ct_default/v1/editorial/2017-Vision-Mercedes-Benz-Maybach-Concept-Pebble-Beach-Blue-Cabriolet-1200x800p-1.jpg')
third_car = Car.create(model: 'Ferrari', year: '2021', price: 2150, image: 'https://www.supercars.net/blog/wp-content/uploads/2020/09/2020-Ferrari-Omologata-001-2160-scaled.jpg')
fourth_car = Car.create(model: 'Mclaren', year: '2015', price: 2550, image: 'https://www.hdcarwallpapers.com/walls/2015_mclaren_650s_coupe_3-wide.jpg')
fifth_car = Car.create(model: 'Nissan GT-R', year: '2015', price: 2550, image: 'https://www.gannett-cdn.com/-mm-/ade337e50c415e3e12cea926f24d60083ea40a92/c=284-400-2759-1798/local/-/media/USATODAY/test/2013/11/19/1384911451000-gt-r5.jpg?width=2475&height=1398&fit=crop&format=pjpg&auto=webp')
sixth_car = Car.create(model: 'Ford GT', year: '2016', price: 1550, image: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Nxrx266lwb12Snk19ZTazAHaEK%26pid%3DApi&f=1&ipt=9eb90592a525f00f96d10ab9ec0ed0c76c7d111abcedf5a0e31ce604254742ab&ipo=images')
seventh_car = Car.create(model: 'Porche 911', year: '2014', price: 2200, image: 'https://www.pixelstalk.net/wp-content/uploads/2016/09/HD-Porsche-911-Wallpaper.jpeg')

first_res = Reservation.create(start_date: '24-03-2023', end_date: '25-03-2023', city: 'London', user_id: 1, car_id: 97)
second_res = Reservation.create(start_date: '29-03-2023', end_date: '30-03-2023', city: 'Lisbon', user_id: 2, car_id: 95)

User.create
User.destroy_all
Car.create
Car.destroy_all
Reservation.create
Reservation.destroy_all