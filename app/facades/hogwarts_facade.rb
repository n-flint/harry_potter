class HogwartsFacade
  
  def initialize(house)
    @house = house
  end

  def student_count
    conn = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/slytherin?api_key=alohamora")
    students = JSON.parse(conn.body)
    # require 'pry'; binding.pry
    count = students['data'][0]['attributes']['students'].count
  end

  def students
    # Use ENV['HOGWARTS_KEY']
    conn = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/slytherin?api_key=alohamora")
    students = JSON.parse(conn.body)['data'][0]['attributes']['students']
    students.map do |student|
      Student.new(student)
    end
  end

end