class VeiculosController < ApplicationController
    before_action :set_veiculo, only: [:show, :update, :destroy]

    # GET /veiculos
    def index  
        @veiculos = Veiculo.all

        render json: @veiculos
    end

    # GET /veiculos/:id
    def show
        render json: @veiculo
    end

    # POST /veiculos
    def create
        @veiculo = Veiculo.new(veiculo_params)

        if @veiculo.save
            render json: @veiculo, status: :created
        else
            render json: @veiculo.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /veiculos/:id
    def update
        if @veiculo.update(veiculo_params)
            render json: @veiculo
        else
            render json: @veiculo.errors, status: :unprocessable_entity
        end
    end

    # DELETE /veiculos/:id
    def destroy
        @veiculo.destroy
    end

    private

        def set_veiculo
            @veiculo = Veiculo.find(params[:id])
        end

        def veiculo_params
            params.require(:veiculo).permit(:marca, :veiculo, :ano, :descricao, :vendido)
        end
end
