class HogwartsFacade
  
  def initialize(house)
    @house = house
  end

  def student_count
    service.total_student_num
  end

  def students
    service.students
  end

  private
    def service
      @_service ||= HogwartsService.new(@house)
    end
end