class SpecializationsController < ApplicationController
    before_action :get_engineering

    def index
        @specializations = @engineering.specializations
    end

    def new
        @specialization = @engineering.specializations.build
    end

    def create
        @specialization = @engineering.specializations.build(specialization_params)
        if @specialization.save
            redirect_to engineering_specializations_path
        else
            render :new
        end
    end

    private

    def get_engineering
        @engineering = Engineering.find(params[:engineering_id])
    end

    def specialization_params
        params.require(:specialization).permit(:branch, :description, :engineering_id)
    end
end
