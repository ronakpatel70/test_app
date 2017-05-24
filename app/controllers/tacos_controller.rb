class TacosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def index
    tacos = Taco.all

    if tacos.present?
      render :json =>tacos
    else
      render :json =>{:result=>{:messages =>"Sorry, Currently table is empty.",:rstatus=>0, :errorcode => ""}, :tacos=>tacos }
    end
  end

  def create
    taco = Taco.new()
    taco.meat = params["meat"]
    taco.rice = params["rice"]
    taco.salsa = params["salsa"]
    taco.notes = params["notes"]

    if taco.save
      render :json =>taco
    else
      render :json =>{:result=>{:messages =>"Sorry, Something went wrong.",:rstatus=>0, :errorcode => "", :taco=>taco} }
    end
  end

  def destroy
    taco = Taco.find(params["id"]) rescue nil

    if taco.destroy
      render :json =>{:result=>{:messages =>"destroy successful.",:rstatus=>1, :errorcode =>""}}
    else
      render :json =>{:result=>{:messages =>"Sorry, Something went wrong.",:rstatus=>0, :errorcode => ""}}
    end
  end

end
