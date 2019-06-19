class HogwartsService

  def initialize(house)
    @house = house
  end

  def total_student_num
    get_students.count
  end

  def students
    # Is this the best place to turn the students in objects?
    get_students.map do |student|
      Student.new(student)
    end
  end

  private
    def conn
      # Use ENV['HOGWARTS_KEY']
      Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/slytherin?api_key=alohamora")
    end

    def get_students
      JSON.parse(conn.body)['data'][0]['attributes']['students']
    end

end