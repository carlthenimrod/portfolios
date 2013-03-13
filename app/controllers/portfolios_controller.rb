class PortfoliosController < ApplicationController

	before_filter :authenticate_user!, except: ['all']

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

	def destroy
		@portfolio = Portfolio.find(params[:id])

		@portfolio.destroy
		
		flash[:success] = "Portfolio successfully deleted!"

		redirect_to action: 'index'
	end

	def show
		@portfolio = Portfolio.find(params[:id])
	end

	def all
		@portfolios = Portfolio.all
	end
end