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

	end

end