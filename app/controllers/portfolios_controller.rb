class PortfoliosController < ApplicationController

	def index
		@portfolios = Portfolio.all
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
		@portfolio = Portfolio.new(params[:portfolio])

		if @portfolio.save
			flash[:success] = "Portfolio successfully created!"

			redirect_to action: 'index'
		else
			render 'new'
		end
	end

	def edit

	end

	def update

	end

	def destroy
		@portfolio = Portfolio.find(params[:id])
		@portfolio.destroy

		redirect_to action: 'index'
	end

	def show
		@portfolio = Portfolio.find(params[:id])
	end

	def all
		@portfolios = Portfolio.all
	end
end