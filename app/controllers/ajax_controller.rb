class AjaxController < ApplicationController
  
  before_filter :authorize
  
  def save
    block = params[:block]
    
    current_block = Block.where(key: block).first
    
    current_block["content"] = params[:content]
    current_block.save
    
    render json: current_block
  end
end
