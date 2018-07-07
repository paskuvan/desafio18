require 'date'

class Course
  attr_reader :name, :dates
  def initialize(name, dates)
    @name = name
    @dates = dates.map { |date| Date.parse(date) }
  end

  def self.crea_course
    courses = []
    lines = File.open('cursos.txt', 'r').readlines
    lines.each do |line|
      new_line = line.split(', ')
      courses << Course.new(new_line.shift, new_line)
    end
    courses
  end

  def self.empieza(date = Date.hoy)
    raise Error.new('no puede encontrar la fecha 2018-01-01 o eliminar.') if date >= Date.new(2018,01,01)
    courses = crea_course
    courses.each do |course|
      puts course.name if date >= course.dates[0]
    end
  end

  def self.termina(date = Date.hoy)
    raise Error.new('no puede encontrar la fecha 2018-01-01 o eliminar.') if date >= Date.new(2018,01,01)
    courses = crea_course
    courses.each do |course|
      puts course.name if date <= course.dates[1]
    end
  end
end

Course.empieza(Date.new(2017,05,01))
Course.termina(Date.new(2017,10,01))