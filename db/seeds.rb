# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Exampleprys:
# require "pry"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = "https://res.cloudinary.com/dtxbqazks/image/upload/v1563374750/uhq8h7th8e8xuadtyv5r.jpg"
url_flat_1 = "https://www.geek.com/wp-content/uploads/2019/03/Supermoon-Lunar-Eclipse--625x352.jpg"
url_flat_2 = "http://www.unificationfrance.com/IMG/jpg/star_trek_into_darkness_costumes_et_vegetation_alien_galerie_photos-0010.jpg"
url_flat_3 = "https://vignette.wikia.nocookie.net/tokinowa/images/0/01/Arcadia.jpg/revision/latest?cb=20160117005716"

Booking.delete_all
Flat.delete_all
User.delete_all


user = User.new( email: "test1@hotmail.ch", password: "123456", name: "test number one",
 description: "Louis XIV, dit « le Grand » et « le Roi-Soleil », né le 5 septembre 1638 au château Neuf de Saint-Germain-en-Laye et mort le 1er septembre 1715 à Versailles, est un roi de France et de Navarre. Il règne sur le royaume de France et de Navarre du 14 mai 1643 (officiellement le 7 septembre 1651) à sa mort en 1715.
 Né Louis, surnommé « Dieudonné »2, il monte sur le trône de France au décès de son père Louis XIII, quelques mois avant son cinquième anniversaire. Il est le 64e roi de France, le 44e roi de Navarre et le troisième roi de France issu de la dynastie des Bourbons. Son règne de 72 ans est l’un des plus longs de l'histoire d'Europe, et le plus long de l'Histoire de France.",
 phonenumber: "0793278345" )
user.remote_avatar_url = url
user.save

2.times do
  flat = Flat.new(address: "calle monteleon 16", description: "Really nice flat
    in the viciny of tatooine", price: 5000000, user: User.last)
  flat.remote_photo_url = url_flat_1
  flat.save
end

2.times do
  flat = Flat.new(address: "2 chemin Roilbot", description: "Nice home near the big
     nebula, with amazing view!", price: 3000000, user: User.last)
  flat.remote_photo_url = url_flat_2
  flat.save
end

2.times do
  flat = Flat.new(address: "1 chome hinode", description: "Cosy place where Captain
    Harlock lived in 2134", price: 3000000, user: User.last)
  flat.remote_photo_url = url_flat_3
  flat.save
end
