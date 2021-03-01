class EngineeringsController < ApplicationController
    before_action :set_engineering, only: %i[ show edit update destroy ]
    
    def index
        @engineerings = Engineering.all
    end

    def show
    end

    def new
        @engineering = Engineering.new
    end

    def edit
    end

    def create
        @engineering = Engineering.new(engineering_params)

        respond_to do |format|
            if @engineering.save
                format.html { redirect_to @engineering, notice: "Subject created!" }
                format.json { render :show, status: :created, location: @engineering }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @engineering.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @engineering.update(engineering_params)
                format.html { redirect_to @engineering, notice: "Subject updated!" }
                format.json { render :show, status: :ok, location: @engineering }
            else
                format.html { render :edit, status: :uprocessable_entity }
                format.json { render json: @engineering.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @engineering.destroy
        respond_to do |format|
            format.html { redirect_to engineerings_url, notice: "Subject deleted!" }
            format.json { head :no_content }
        end
    end

    private

        def set_engineering
            @engineering = Engineering.find(params[:id])
        end

        def engineering_params
            params.require(:engineering).permit(:subject, :description, :units, :seasonal)
        end
end
