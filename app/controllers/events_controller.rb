class EventsController < ApplicationController
  # GET /events
  # GET /events.json

  before_filter :check_role, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :check_session

  def check_role
    @user = User.find(session[:user_id])
    
    if @user.role == "User"
      redirect_to events_path
    end
  end

  def check_session
    if session[:user_id] == nil
      redirect_to "/login"
    end
  end
  
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    
    if !Invitation.where(:event_id => @event.id, :user_id => session[:user_id]).first and User.find(session[:user_id]).role != "Admin"
      redirect_to events_path and return
    end

    @suggestions = Suggestion.find_all_by_event_id(@event.id)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create

    @movies = params[:event][:movie_ids]
    params[:event].delete(:movie_ids)
    @event = Event.new(params[:event])
    
    if @movies
      @movies.each do |movie|
        @event.suggestions.build(:movie_id => movie)
      end
    end
      
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def rank
    @event = Event.find(params[:id])
    @suggestions = Suggestion.find_all_by_event_id(@event.id)

    respond_to do |format|
    format.html
    format.json { render json: @event }
    end
  end

  def send_ranks

    @event = Event.find(params[:id])

    i = 1

    params.each do |key,value|
      
      if key.include?("rankedmovie")
        s = Suggestion.where(:user_id => session[:user_id], :event_id => @event.id, :movie_id => key.gsub("rankedmovie","")).first
        
        puts "=============================="
        puts s
        puts s.event_id
        puts s.movie_id
        puts s.id
        puts "=============================="

        r = nil

        if !(r = Ranking.where(:user_id => session[:user_id], :suggestion_id => s.id).first)
          r = Ranking.new
          r.user_id = session[:user_id]
          r.suggestion_id = s.id
        end
        
        r.value = i
        r.save
        i = i + 1
      end
    end

    respond_to do |format|
      format.html { redirect_to "/events/#{@event.id}" }
      format.json { head :no_content }
    end
  end

  def suggestions
    @event = Event.find(params[:id])
    @suggestions = Suggestion.find_all_by_event_id(@event.id)
    @movies = Movie.find(:all)
    
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  def send_suggestions
    @event = Event.find(params[:id])
    
    params.each do |key, value|
      
      if key.include?("checkedmovie")
        s = Suggestion.new
        s.user_id = session[:user_id]
        s.event_id = @event.id
        s.movie_id = key.gsub("checkedmovie","").to_i
        s.save
      end

    end

    respond_to do |format|
      format.html { redirect_to "/events/#{@event.id}" }
      format.json { head :no_content }
    end
  end
  
  def invite
    @event = Event.find(params[:id])
    @users = User.find(:all) - @event.users
    
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  def send_invitations
    @event = Event.find(params[:id])
    
    params.each do |key, value|
      if key.include?("checkeduser")
        i = Invitation.new
        i.event_id = @event.id
        i.user_id = key.gsub("checkeduser","")
        i.save
      end
    end

    respond_to do |format|
      format.html { redirect_to "/events/#{@event.id}" }
      format.json { head :no_content }
    end
  end

end
