class PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def create
    person = Person.create(person_params)
    if person.saves
      redirect_to person_path(person)
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(page_params)
      # Success
      redirect_to person_path(@person)
    else
      # Fail
      render :edit
    end
  end

  def destroy
    person = Person.find(params[:id])
    person.destroy
    redirect_to person_path
  end

  def new
    @person = Person.new
  end
end
