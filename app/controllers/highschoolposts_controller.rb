class HighschoolpostsController < ApplicationController
  before_action :set_highschoolpost, only: [:show, :edit, :update, :destroy]
  # if a user is not signed in, they will not be able to create new content
  before_action :authorize, :only => [:create] 
  # GET /highschoolposts
  # GET /highschoolposts.json
  def index
    @highschoolposts = Highschoolpost.all
  end

  # GET /highschoolposts/1
  # GET /highschoolposts/1.json
  def show
  end

  # GET /highschoolposts/new
  def new
    @highschoolpost = Highschoolpost.new
  end

  # GET /highschoolposts/1/edit
  def edit
  end

  # POST /highschoolposts
  # POST /highschoolposts.json
  def create
    @highschoolpost = Highschoolpost.new(highschoolpost_params)
    respond_to do |format|
      if @highschoolpost.save
        format.html { redirect_to @highschoolpost, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @highschoolpost }
      else
        format.html { render :new }
        format.json { render json: @highschoolpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highschoolposts/1
  # PATCH/PUT /highschoolposts/1.json
  def update
    respond_to do |format|
      if @highschoolpost.update(highschoolpost_params)
        format.html { redirect_to @highschoolpost, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @highschoolpost }
      else
        format.html { render :edit }
        format.json { render json: @highschoolpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highschoolposts/1
  # DELETE /highschoolposts/1.json
  def destroy
    @highschoolpost.destroy
    respond_to do |format|
      format.html { redirect_to highschoolposts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highschoolpost
      @highschoolpost = Highschoolpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highschoolpost_params
      # everything that is passed in inside a param, therefore everything that a 
      # logged in admin can do to create new content
      params.require(:highschoolpost).permit(:title, :body, :file, images: [])
    end

    # method for if user is not signed in and tries to create a new post, they will be 
    # redirected to a sign in page
    def authorize
    redirect_to new_session_path, alert: 'Please Sign In or Sign Up!' if current_user.nil?
    end
end
