class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def junior
    director_records = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @the_youngest_director = director_records.at(-1)
    render({ :template => "director_templates/young"})
  end 

  def senior
    director_records = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @the_eldest_director = director_records.at(0)
    render({ :template => "director_templates/senior"})
  end 

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)
    render({ :template => "director_templates/details"})
  end
end
