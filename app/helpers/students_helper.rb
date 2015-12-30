module StudentsHelper

  def birdtype_display(value)
    case value
      when :egg
        "Egg"
      when :pigeon
        "Pigeon"
      when :eagle
        "Eagle"
      when :condor
        "Condor"
      when :albatross
        "Albatross"
    end
  end
end
