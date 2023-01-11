class ScalesController < ApplicationController
  require 'csv'

  def index
    if params[:category] === "all"
      @scales = Scale.all
    else
      @scales = Scale.where(category: params[:category]).order(:date)
    end
    sum = 0
    @scales.each do |scale|
      if scale.unit === "kilograms"
        sum += scale.weight
      elsif scale.unit === "grams"
        sum += scale.weight / 1000
      elsif scale.unit === "pounds"
        sum += scale.weight * 0.45
      end
    end
    response = {
      :scales => @scales,
      :sum => sum
    }
    render json: response;
  end

  def upload
    # puts params[:file]

    # file_params.each do |file|
    #   puts file
    #   parser_method(file.path)
    # end
    # file_path = file_params
    parser_method(file_params)
    response = {
      :message => "success"
    }
    render json: response;
  end

  def categories
    @scales = Scale.all
    categories = []
    @scales.each do |scale|
      if !categories.include? scale.category
        categories.push(scale.category)
      end
    end
    response = {
      :categories => categories
    }
    render json: response
  end

  def parser_method(file_path)
    CSV.foreach(file_path, col_sep: ",", headers: true) do |row|
      scale = Scale.new
      scale.date =row[0]
      scale.product_id =row[1]
      scale.weight =row[2]
      scale.unit =row[3]
      scale.category = row[1].first(3)
      scale.save
      puts row[1]
    end
  end

  private 
    def file_params
      params.require(:file).path
    end

end
