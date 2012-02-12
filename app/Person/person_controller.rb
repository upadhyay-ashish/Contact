require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'rho/rhocontact'

class PersonController < Rho::RhoController
  include BrowserHelper

  # GET /Person
  def index
    @people = Rho::RhoContact.find(:all)
    render :back => '/app'
  end

  # GET /Person/{1}
  def show
    @person = Rho::RhoContact.find(@params['id'])
    if @person
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Person/new

  # POST /Person/{1}/delete
  def delete
    @person = Rho::RhoContact.find(@params['id'])
    @person.destroy if @person
    redirect :action => :index  
  end
end
