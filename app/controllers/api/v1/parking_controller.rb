module Api
	module V1
        class ParkingController < ApplicationController

            # Listar todos os Carros
			def index
				parkings = Parking.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Cars in the parking lot', data:parkings},status: :ok
            end

            # Adicionar Carros
            def create

                parking_params = post_params

                parking_params[:entry_at] = DateTime.now

                parking = Parking.new(parking_params)

				if parking.save
					render json: {status: 'SUCCESS', message:'Saved car', data:parking},status: :ok
				else
					render json: {status: 'ERROR', message:'Car not saved', data:parking.errors},status: :unprocessable_entity
				end
            end

            # Parametros aceitos
			private	def post_params
                params.permit(:plate)
			end

            # Registrar Pagamento do Estacionamento
            def pay

                parking = Parking.find(params[:parking_id])

                parking.paid = true

                time = ((DateTime.now - parking.entry_at.to_datetime) * 24 * 60).to_i
                
                parking.time = time.to_s+" minutes"

				if parking.save
				    render json: {status: 'SUCCESS', message:'Paid', data:parking},status: :ok
				else
                    render json: {status: 'ERROR', message:'Not Paid', data:parking.errors},status: :unprocessable_entity
				end
            end

            # Registrar Saída do Carro
            def out
                
                parking = Parking.find(params[:parking_id])

                if (parking.paid?)
                    parking.left = true
                    
                    parking.exit_at = DateTime.now

                    if parking.save
                        render json: {status: 'SUCCESS', message:'Registered output', data:parking},status: :ok
                    else
                        render json: {status: 'ERROR', message:'Failed to register', data:parking.errors},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'ERROR', message:'Output not released! Payment not found.', data:parking},status: :not_found
                end
            end
            
            # Listar Carros passando placa
			def show
				parking = Parking.where(plate: params[:id])
				render json: {status: 'SUCCESS', message:'Loaded parking', data:parking},status: :ok
			end
		end
	end
end