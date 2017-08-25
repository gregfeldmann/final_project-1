class EntertainmentsController < ApplicationController
  def index
    @entertainments = Entertainment.all 
    
    @average = @entertainments.group(:title).average(:rating)
  
  
     # @average_rating = @entertainments.where(:entertaintment)  

     #@ratings = Rating.all.group_by(&:entertainment.title)
    
    #Entertainment.ratings.group(:title).average(:rating)
  

    render("entertainments/index.html.erb")
  end

  def show
    @entertainment = Entertainment.find(params[:id])

    render("entertainments/show.html.erb")
  end

  def new
    @entertainment = Entertainment.new

    render("entertainments/new.html.erb")
  end

  def create
    @entertainment = Entertainment.new

    @entertainment.picture = params[:picture]
    @entertainment.title = params[:title]
    @entertainment.category = params[:category]
    @entertainment.rating = params[:rating]

    save_status = @entertainment.save

    if save_status == true
      redirect_to("/entertainments/#{@entertainment.id}", :notice => "Entertainment created successfully.")
    else
      render("entertainments/new.html.erb")
    end
  end

  def edit
    @entertainment = Entertainment.find(params[:id])

    render("entertainments/edit.html.erb")
  end

  def update
    @entertainment = Entertainment.find(params[:id])

    @entertainment.picture = params[:picture]
    @entertainment.title = params[:title]
    @entertainment.category = params[:category]
    @entertainment.rating = params[:rating]

    save_status = @entertainment.save

    if save_status == true
      redirect_to("/entertainments/#{@entertainment.id}", :notice => "Entertainment updated successfully.")
    else
      render("entertainments/edit.html.erb")
    end
  end

  def destroy
    @entertainment = Entertainment.find(params[:id])

    @entertainment.destroy

    if URI(request.referer).path == "/entertainments/#{@entertainment.id}"
      redirect_to("/", :notice => "Entertainment deleted.")
    else
      redirect_to(:back, :notice => "Entertainment deleted.")
    end
  end
end
