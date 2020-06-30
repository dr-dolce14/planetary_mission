class MissionsController < ApplicationController

    def index
        @missions = Mission.all
    end

    def show
        @mission = Mission.find(params[:id])
    end

    def new
    @mission = Mission.new
    @planets = Planet.all
    @scientists = Scientist.all 
    end

    def create
    @mission = Mission.create(mission_params)
    if @mission.valid?
    redirect_to scientist_path(@mission.scientist.id)
    else  
        flash[:my_errors] = @mission.errors.full_messages
        redirect_to new_mission_path
    end
    end

    private

    def mission_params
        params.require(:mission).permit(:planet_id, :scientist_id, :name)
    end 
end
