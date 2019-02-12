# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Usuario ActiveAdmin
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
#Usuarios de la aplicacion
user1 = User.create!(username: 'asubia' , password: '123123' , password_confirmation: '123123') if Rails.env.development?
user2 = User.create!(username: 'jalmeida',  password: '123123' , password_confirmation: '123123') if Rails.env.development?
user3 = User.create!(username: 'amoran',  password: '123123' , password_confirmation: '123123') if Rails.env.development?
user4 = User.create!(username: 'vgomez',  password: '123123' , password_confirmation: '123123') if Rails.env.development?
user5 = User.create!(username: 'apazmino',  password: '123123' , password_confirmation: '123123') if Rails.env.development?
user6 = User.create!(username: 'pzambrano',  password: '123123' , password_confirmation: '123123') if Rails.env.development?
user7 = User.create!(username: 'cmontenegro',  password: '123123' , password_confirmation: '123123') if Rails.env.development?

#Posiciones
pres = Position.create(name: 'Presidente', desc: 'Presidente del Club')
vicepre = Position.create(name: 'Vicepresidente', desc: 'Vicepresidente del Club')
tesorero = Position.create(name: 'Tesorero', desc: 'Tesorero del Club, encargado de las altas finanzas.')
miembro = Position.create(name: 'Miembro', desc: 'Miembro regular del Club')


# Eventos
event1 = Event.create(
  name: 'Juegos InterUniversidades 2018',
  desc: 'Torneo anual interuniversidades con sede en Espol con coordinacion de SuitCase, Ubep y Liga Deportiva Politecnica',
  due_time: DateTime.parse('2018-12-10 15:00:00'),
  tipo: 'Deportivo'
)
event2 = Event.create(
  name: 'I3Week',
  desc: 'Semana de la innovacion de Espol, en el transcurso de la semana se daran una serie de conferencias y concursos donde SuitCase ofrece servicio de protocolo',
  due_time: DateTime.parse('2018-11-26 11:00:00'),
  tipo: 'Academico'
)

event3 = Event.create(
  name: 'Festival de Bandas 2019',
  desc: 'Primer festival de bandas de Espol con ayuda de UBEP donde grandes musicos expondran su talento',
  due_time: DateTime.parse('2019-07-26 11:00:00'),
  tipo: 'Cultural'
)

# 3 member admins
alex = Member.create(
  name: 'Alex Stefano',
  last_name: 'Subia Nugra',
  dob: Date.parse('1993-06-27'),
  date_ingreso: Date.parse('2018-01-12'),
  position_id: pres.id,
  carrera: 'Licenciatura en Turismo',
  email: '',
  about_me: '',
  user_id: user1.id
)

jimmy = Member.create(
  name: 'Jimmy Alexander',
  last_name: 'Almeida Loor',
  dob: Date.parse('1994-12-12'),
  date_ingreso: Date.parse('2017-04-24'),
  position_id: vicepre.id,
  carrera: 'Licenciatura en Turismo',
  email: '',
  about_me: '',
  user_id: user2.id
)

andrew = Member.create(
  name: 'Andrew Alexander',
  last_name: 'Moran Arreaga',
  dob: Date.parse('2000-01-03'),
  date_ingreso: Date.parse('2018-05-07'),
  position_id: tesorero.id,
  carrera: 'Ingenieria en Logistica y Transporte',
  email: '',
  about_me: '',
  user_id: user3.id
)

#4 member clients
valeria = Member.create(
  name: 'Valeria Carolina',
  last_name: 'Gomez Vaca',
  dob: Date.parse('1999-09-24'),
  date_ingreso: Date.parse('2018-05-07'),
  position_id: miembro.id,
  carrera: 'Ingenieria Estadistica',
  email: '',
  about_me: '',
  user_id: user4.id
)

ana = Member.create(
  name: 'Ana Elizabeth',
  last_name: 'Pazmino Sanchez',
  dob: Date.parse('1996-09-16'),
  date_ingreso: Date.parse('2017-04-24'),
  position_id: miembro.id,
  carrera: 'Licenciatura en turismo',
  email: '',
  about_me: '',
  user_id: user5.id
)

pedro = Member.create(
  name: 'Pedro Jose',
  last_name: 'Zambrano Gutierrez',
  dob: Date.parse('1998-10-02'),
  date_ingreso: Date.parse('2018-01-12'),
  position_id: miembro.id,
  carrera: 'Licenciatura en turismo',
  email: '',
  about_me: '',
  user_id: user6.id
)

carlos = Member.create(
  name: 'Carlos Javier',
  last_name: 'Montenegro Rivadeneira',
  dob: Date.parse('1999-06-06'),
  date_ingreso: Date.parse('2018-05-07'),
  position_id: miembro.id,
  carrera: 'Ingenieria en Logistica y Transporte',
  email: '',
  about_me: '',
  user_id: user7.id
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
  member_id: ana.id
)

post3 = Post.create(
  title: 'Anunciado auspiciante para el Datajam 2019!',
  content: 'El auspiciante del datajam 2019 es una empresa de apuestas en línea',
  member_id: valeria.id
)

# Add comments to post!
PostComment.create(
  title: 'Felicitaciones!',
  content: 'Felicitaciones a los ganadores. '\
'Todos los equipos hicieron un gran trabajo!',
  author: alex.name,
  member_id: pedro.id,
  post_id: post3.id
)

PostComment.create(
  title: 'Felicitaciones!',
  content: 'Felicitaciones por conseguir '\
'un nuevo auspiciante para el evento! Son lo máximo!',
  author: alex.name,
  member_id: alex.id,
  post_id: post3.id
)

#Announcements
Announcement.create(
  title: 'Eleccion Nueva Directiva',
  fulltext: 'Chicos, desde el sabado 16 de febrero comienza la camapana electoral para las nuevas listas. Nuestros mejores deseos para ambas listas.',
  member_id: alex.id
)

Announcement.create(
  title: 'Curso a Profesionales',
  fulltext: 'Estimados miembros, en el mes de Marzo se va a dictar un curso sobre logistica y organizacion de eventos. Proximamente mas informacion.',
  member_id: jimmy.id
)

Announcement.create(
  title: 'Rendicion de cuentas',
  fulltext: 'Debido a que la presenta directiva esta pasando por un proceso de transicion, proximamente se realizara la rendicion de cuentas sobre el periodo 2018.',
  member_id: andrew.id
)

# Tasks
#For event1 (Juegos Interuniversidades)
reserva_coliseo = Task.create(
  name: 'Reservar el coliseo',
  desc: 'Se necesita que alguien reserve el coliseo para la inauguracion de los Juegos InterUniversidades.',
  deadline: DateTime.parse('2018-10-12 00:00:00'),
  completed: true,
  event_id: event1.id
)

invitaciones = Task.create(
  name: 'Invitar Universidades',
  desc: 'Se necesita que alguien envie las respectivas invitaciones a las Universidades.',
  deadline: DateTime.parse('2018-10-20 00:00:00'),
  completed: false,
  event_id: event1.id
)

#For event2 (I3Week)
reserva_STEM = Task.create(
  name: 'Reservar el STEM (Edificio Post-grados mecanica)',
  desc: 'Se necesita que alguien reserve el auditorio para la inauguracion de la Semana '\
  'de la Innovacion',
  deadline: DateTime.parse('2018-08-26 00:00:00'),
  completed: true,
  event_id: event2.id
)
reserva_auditorio = Task.create(
  name: 'Reservar el auditorio',
  desc: 'Se necesita que alguien reserve el auditorio para la capacitacion a los estudiantes '\
  'en el uso de las herramientas de prototipado',
  deadline: DateTime.parse('2018-09-26 00:00:00'),
  completed: true,
  event_id: event2.id
)

#For event3 (Festival de Bandas)
equipos = Task.create(
  name: 'Reunión con auspiciante para solicitar equipos',
  desc: 'Puntos a discutir: <br> '\
    '- ¿Cómo será la marca del auspiciante mostrada en el evento? <br>' \
    '- ¿Con que equipos nos puede colaborar? <br>'\
    '- Etc...',
  deadline: DateTime.parse('2018-05-26 13:30:00'),
  completed: true,
  event_id: event3.id
)

bocaditos = Task.create(
  name: 'Reunión con auspiciante para bocaditos',
  desc: 'Puntos a discutir: <br> '\
    '- ¿Cómo será la marca del auspiciante mostrada en el evento? <br>' \
    '- ¿Qué productos nos van a proporcionar para el apoyo? <br>'\
    '- Etc...',
  deadline: DateTime.parse('2018-06-10 13:30:00'),
  completed: false,
  event_id: event3.id
)


# Assignments
Assignment.create(
  member_id: valeria.id,
  task_id: reserva_coliseo.id,
  score: 2
)

Assignment.create(
  member_id: ana.id,
  task_id: invitaciones.id,
)

Assignment.create(
  member_id: valeria.id,
  task_id: reserva_STEM.id,
  score: 3
)

Assignment.create(
  member_id: jimmy.id,
  task_id: reserva_auditorio.id,
  score: 3
)

Assignment.create(
  member_id: carlos.id,
  task_id: equipos.id,
  score: 5
)

Assignment.create(
  member_id: carlos.id,
  task_id: bocaditos.id,
)

