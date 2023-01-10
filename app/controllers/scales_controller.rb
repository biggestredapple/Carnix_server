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
  end

  def parser_method(file_path)
    CSV.foreach(file_path, col_sep: ",", headers: true) do |row|
      puts row[1]
    end
  end

end
