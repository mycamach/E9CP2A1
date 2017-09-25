require 'date'

class Course
  attr_reader :name, :dates
  def initialize(name, dates)
    @name = name
    @dates = dates.map { |date| Date.parse(date) }
  end

  def self.create_course
    courses = []
    lines = File.open('cursos.txt', 'r').readlines
    lines.each do |line|
      new_line = line.split(', ')
      courses << Course.new(new_line.shift, new_line)
    end
    courses
  end

  def self.starts_before(date = Date.today)
    raise ArgumentError.new('date cannot be 2018-01-01 or further.') if date >= Date.new(2018,01,01)
    courses = create_course
    courses.each do |course|
      puts course.name if date >= course.dates[0]
    end
  end

  def self.ends_after(date = Date.today)
    raise ArgumentError.new('date cannot be 2018-01-01 or further.') if date >= Date.new(2018,01,01)
    courses = create_course
    courses.each do |course|
      puts course.name if date <= course.dates[1]
    end
  end
end

Course.starts_before(Date.new(2017,05,01))
Course.ends_after(Date.new(2017,10,01))
