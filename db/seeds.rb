# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Artur', email: 'artgouveiag@gmail.com')
second_user = User.create(name: 'majo', email: 'majo@gmail.com')

first_car = Car.create(user_id: 1, model: 'Lamborgini', year: '2019', price: 2750, image: 'https://wallup.net/wp-content/uploads/2019/09/848518-2010-lamborghini-sesto-elemento-concept-supercar-748x561.jpg')
second_car = Car.create(user_id: 1, model: 'Mercedes', year: '2021', price: 1750, image: 'https://carsguide-res.cloudinary.com/image/upload/f_auto%2Cfl_lossy%2Cq_auto%2Ct_default/v1/editorial/2017-Vision-Mercedes-Benz-Maybach-Concept-Pebble-Beach-Blue-Cabriolet-1200x800p-1.jpg')
third_car = Car.create(user_id: 1, model: 'Ferrari', year: '2021', price: 2150, image: 'https://www.supercars.net/blog/wp-content/uploads/2020/09/2020-Ferrari-Omologata-001-2160-scaled.jpg')
fourth_car = Car.create(user_id: 1, model: 'Mclaren', year: '2015', price: 2550, image: 'https://www.hdcarwallpapers.com/walls/2015_mclaren_650s_coupe_3-wide.jpg')
fifth_car = Car.create(user_id: 1, model: 'Maserati granTurismo', year: '2021', price: 2550, image: 'https://images.hgmsites.net/hug/2014-maserati-granturismo_100464581_h.jpg')
sixth_car = Car.create(user_id: 2, model: 'Ford GT', year: '2016', price: 1550, image: 'https://media.gettyimages.com/id/1406533077/photo/the-ford-gt.jpg?s=612x612&w=gi&k=20&c=QT009xEgUUa3CgCqS5PSisBGOqtjS_ND1lpMoBGPBFI=')
seventh_car = Car.create(user_id: 1, model: 'Porche 911', year: '2014', price: 2200, image: 'https://www.pixelstalk.net/wp-content/uploads/2016/09/HD-Porsche-911-Wallpaper.jpeg')

# first_res = Reservation.create(start_date: '24-03-2023', end_date: '25-03-2023', city: 'London', user_id: 1)
# second_res = Reservation.create(start_date: '29-03-2023', end_date: '30-03-2023', city: 'Lisbon', user_id: 2)

User.destroy_all
User.create
Car.destroy_all
# Car.delete_all
Car.create
# Reservation.destroy_all
# Reservation.delete_all
# Reservation.create
