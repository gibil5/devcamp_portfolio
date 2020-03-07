class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all
    #@portfolio_items = Portfolio.where(subtitle: "Ruby on Rails")
    #@portfolio_items = Portfolio.where(subtitle: "Angular")
    #@portfolio_items = Portfolio.ruby_on_rails_items
  end

  def angular
    @portfolio_items = Portfolio.angular
    render 'index'
  end

  def ror
    @portfolio_items = Portfolio.angular
    @portfolio_items = Portfolio.ruby_on_rails_items
    render 'index'
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end


  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end


  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was destroyed.' }
    end
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
