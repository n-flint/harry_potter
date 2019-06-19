class Student
  attr_reader :name, 
              :id

  def initialize(student)
    @name = student['name']
    @id = student['id']
  end
end