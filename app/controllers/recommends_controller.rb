class RecommendsController < ApplicationController
  def index
    @recommends = Recommend.all
    
    #Recommend.where(:receiver_id => :current_user)
    
    #Recommend.where(:user_id => :current_user)
    
    @recommends_received = Recommend.where(:receiver_id => :current_user)
    
    
    #@recommends = current_user.recommends

    render("recommends/index.html.erb")
  end

  def show
    @recommend = Recommend.find(params[:id])

    render("recommends/show.html.erb")
  end

  def new
    @recommend = Recommend.new
    
    @recommend.user_id = current_user.id

    render("recommends/new.html.erb")
  end

  def create
    @recommend = Recommend.new

    @recommend.entertainment_id = params[:entertainment_id]
    @recommend.user_id = params[:user_id]
    @recommend.username = params[:username]
    @recommend.receiver_id = params[:receiver_id]

    save_status = @recommend.save

    if save_status == true
      redirect_to("/recommends/#{@recommend.id}", :notice => "Recommend created successfully.")
    else
      render("recommends/new.html.erb")
    end
  end

  def edit
    @recommend = Recommend.find(params[:id])

    render("recommends/edit.html.erb")
  end

  def update
    @recommend = Recommend.find(params[:id])

    @recommend.entertainment_id = params[:entertainment_id]
    @recommend.user_id = params[:user_id]
    @recommend.username = params[:username]
    @recommend.receiver_id = params[:receiver_id]

    save_status = @recommend.save

    if save_status == true
      redirect_to("/recommends/#{@recommend.id}", :notice => "Recommend updated successfully.")
    else
      render("recommends/edit.html.erb")
    end
  end

  def destroy
    @recommend = Recommend.find(params[:id])

    @recommend.destroy

    if URI(request.referer).path == "/recommends/#{@recommend.id}"
      redirect_to("/", :notice => "Recommend deleted.")
    else
      redirect_to(:back, :notice => "Recommend deleted.")
    end
  end
end
