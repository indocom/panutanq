# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
#                          { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(fullname: 'admin',
                    email: 'website.pinus@gmail.com', password: 'admin123')

admin.add_role :admin

User.create(fullname: 'abcd', email: 'abcd@gmail.com', password: 'user123')

category = Category.create(name: 'default')

Event.create(name: 'NUANSA', category: category, description: "
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pellentesque enim eu maximus dapibus. Sed semper leo a arcu dapibus maximus. Donec nec velit ut velit finibus interdum laoreet vel leo. Nulla tempor turpis sed orci suscipit laoreet. Etiam nec nibh tellus. Ut ut nulla at justo tristique dapibus et eget diam. Cras interdum nulla orci, at auctor sem fermentum ac. Donec nec vulputate sem, ut finibus purus. Cras id odio id diam rutrum feugiat id ac odio. Praesent vitae odio arcu. Phasellus placerat nibh sed ex dictum malesuada. Quisque efficitur, est ac porttitor mattis, nisl dolor ullamcorper elit, eu euismod arcu leo ut tortor. Duis ac venenatis libero, suscipit imperdiet nunc. Nam non rutrum metus, ac sagittis augue. Maecenas vel nisi vel magna elementum commodo. Proin cursus felis a augue luctus hendrerit eget quis nulla.")
Event.create(name: 'Misi Kami Peduli', category: category)
Event.create(name: 'Orientation', category: category)
Event.create(name: 'POPI', category: category)
Event.create(name: 'Nusantaraku', category: category)
