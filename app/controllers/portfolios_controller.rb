class PortfoliosController < ApplicationController

	include PortfoliosHelper

	before_filter :authenticate_user!, except: ['all', 'show']

	def index
		@portfolios = Portfolio.all
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
		@portfolio = Portfolio.new(params[:portfolio])

		count = Portfolio.count + 1

		@portfolio.order_id = count


		if @portfolio.save
			flash[:success] = "Portfolio successfully created!"

			redirect_to action: 'index'
		else
			flash[:error] = @portfolio.errors.full_messages
			
			render 'new'
		end
	end

	def edit
		@portfolio = Portfolio.find(params[:id])
	end

	def update
		@portfolio = Portfolio.find(params[:id])

		if @portfolio.update_attributes(params[:portfolio])
			flash[:success] = "Portfolio successfully updated!"

			redirect_to action: 'index'
		else
			flash[:error] = @portfolio.errors.full_messages

			render 'edit'
		end
	end

	def update_multiple
		if Portfolio.any?

			count = Portfolio.count

			count = (1..count).to_a

			order = set_order params[:order_ids], count

			Portfolio.update(order.keys, order.values)
			
			flash[:success] = "Portfolios successfully ordered!"

			redirect_to portfolios_url
		else
			redirect_to portfolios_url
		end
	end

	def destroy
		@portfolio = Portfolio.find(params[:id])
			
		current = @portfolio.order_id
		count = Portfolio.count

		@portfolio.destroy

		flash[:success] = "Portfolio successfully deleted!"

		if Portfolio.any?

			while current < count
				current += 1

				record = Portfolio.find_by_order_id(current)

				record.order_id = current - 1
				record.save
			end

			redirect_to portfolios_url
		else
			redirect_to portfolios_url
		end
	end

	def show
		@portfolio = Portfolio.find(params[:id])
	end

	def all
		@portfolios = Portfolio.all
	end
end