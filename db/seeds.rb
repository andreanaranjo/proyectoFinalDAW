# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Position.create(name: 'Presidente', desc: 'Presidente del Club')
Position.create(name: 'Vicepresidente', desc: 'Vicepresidente del Club')
Position.create(name: 'Miembro', desc: 'Miembro regular del Club')

# Add 2 events
event1 = Event.create(
  name: 'Juegos InterUniversidades 2018',
  desc: 'Torneo anual interuniversidades con sede en Espol con coordinacion de SuitCase, Ubep y Liga Deportiva Politecnica',
  due_time: DateTime.parse('2019-12-10 15:00:00')
)
event2 = Event.create(
  name: 'I3Week',
  desc: 'Semana de la innovacion de Espol, en el transcurso de la semana se daran una serie de conferencias y concursos donde SuitCase ofrece servicio de protocolo',
  due_time: DateTime.parse('2018-11-26 11:00:00')
)

# Add 3 members
alex = Member.create(
  name: 'Alex Stefano',
  last_name: 'Subia Nugra',
  dob: Date.parse('1993-06-27'),
  date_ingreso: Date.parse('2018-01-12')
)

jimmy = Member.create(
  name: 'Jimmy Alexander',
  last_name: 'Almeida Loor',
  dob: Date.parse('1994-12-12'),
  date_ingreso: Date.parse('2017-04-24')
)

valeria = Member.create(
  name: 'Valeria Carolina',
  last_name: 'Gomez Vaca',
  dob: Date.parse('1999-09-24'),
  date_ingreso: Date.parse('2018-05-07')
)

# Add posts
post1 = Post.create(
  title: 'Prepárate para el Datajam 2018',
  content: 'Datajam 2018 es el concurso de ciencia de datos más innovador en ecuador!',
  member_id: jimmy.id
)

post2 = Post.create(
  title: 'Ganadores del Datajam 2018',
  content: 'Los ganadores del datajam 2018 fueron los siguientes!',
  member_id: alex.id
)

post3 = Post.create(
  title: 'Anunciado auspiciante para el Datajam 2019!',
  content: 'El auspiciante del datajam 2019 es una empresa de apuestas en línea',
  member_id: valeria.id
)

# Add comments to post!
PostComment.create(
  title: 'Felicitaciones!',
  content: 'Felicitaciones por conseguir '\
'un nuevo auspiciante para el evento! Son lo máximo!',
  author: alex.name,
  member_id: alex.id,
  post_id: post3.id
)


# Add tasks to the event!
bocaditos = Task.create(
  name: 'Reunión con auspiciante para bocaditos',
  desc: 'Puntos a discutir: <br> '\
    '- ¿Cómo será la marca del auspiciante mostrada en el evento? <br>' \
    '- ¿Qué productos nos van a proporcionar para el apoyo? <br>'\
    '- Etc...',
  deadline: DateTime.parse('2018-09-11 13:30:00'),
  completed: false,
  event_id: event2.id
)

reserva_aula = Task.create(
  name: 'Reservar la sala XYZ',
  desc: 'Se necesita que alguien reserve la sala XYZ para capacitar a los estudiantes '\
  'en el uso de las herramientas de prototipado',
  deadline: DateTime.parse('2018-09-13 00:00:00'),
  completed: false,
  event_id: event1.id
)

# Add task asignees
Assignment.create(
  member_id: alex.id,
  task_id: bocaditos.id,
)

Assignment.create(
  member_id: jimmy.id,
  task_id: bocaditos.id
)

Assignment.create(
  member_id: valeria.id,
  task_id: reserva_aula.id
)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
