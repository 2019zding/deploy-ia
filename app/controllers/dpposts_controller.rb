class DppostsController < ApplicationController
  before_action :set_dppost, only: [:show, :edit, :update, :destroy]
  # if a user is not signed in, they will not be able to create new content
  before_action :authorize, :only => [:create] 
  # GET /dpposts
  # GET /dpposts.json
  def index
    @dpposts = Dppost.all
  end

  # GET /dpposts/1
  # GET /dpposts/1.json
  def show
  end

  # GET /dpposts/new
  def new
    @dppost = Dppost.new
  end

  # GET /dpposts/1/edit
  def edit
  end

  # POST /dpposts
  # POST /dpposts.json
  def create
    @dppost = Dppost.new(dppost_params)
    respond_to do |format|
      if @dppost.save
        format.html { redirect_to @dppost, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @dppost }
      else
        format.html { render :new }
        format.json { render json: @dppost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dpposts/1
  # PATCH/PUT /dpposts/1.json
  def update
    respond_to do |format|
      if @dppost.update(dppost_params)
        format.html { redirect_to @dppost, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @dppost }
      else
        format.html { render :edit }
        format.json { render json: @dppost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dpposts/1
  # DELETE /dpposts/1.json
  def destroy
    @dppost.destroy
    respond_to do |format|
      format.html { redirect_to dpposts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dppost
      @dppost = Dppost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dppost_params
      # everything that is passed in inside a param, therefore everything that a 
      # logged in admin can do to create new content
      params.require(:dppost).permit(:title, :body, :file, images: [])
    end

    # method for if user is not signed in and tries to create a new post, they will be 
    # redirected to a sign in page
    def authorize
    redirect_to new_session_path, alert: 'Please Sign In or Sign Up!' if current_user.nil?
    end
end
