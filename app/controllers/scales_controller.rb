class ScalesController < ApplicationController
  require 'csv'

  def index
  end

  def upload
    # (params[:file].path || []).each do |file|
    #   parser_method(file.path)
    # end
    file_path = params[:file].path
    parser_method(file_path)
    response = {
      :message => "success"
    }
    render json: response;
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

end
