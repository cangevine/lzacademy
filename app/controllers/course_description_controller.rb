class CourseDescriptionController < ApplicationController
  
  respond_to :html, :js
  
  def spanish_explorers
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def spanish
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def french
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def latin
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def german
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def italian
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def chinese
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def arabic
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def hebrew
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def ancient_greek
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def asl
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def russian
    respond_with do |format|
      format.html
      format.js { render :layout => false }
    end
  end

end
