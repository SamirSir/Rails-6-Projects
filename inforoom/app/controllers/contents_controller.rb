class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  


  # accessing python file 
  def pythonfile
    ruby_var1 = "Python is my favorite language"
    @favPL = `python lib/assets/python/message.py "#{ruby_var1}" `
  end

  # array implementation 
  # require 'will_paginate/array'
  # GET /contents
  # GET /contents.json
  def index  
    @contents = Content.paginate(page: params[:page])
    # @contents = []
    # Content.all.each do |content|
    #   @contents.push(content)
    # end
    # @contents= @contents.paginate(page: params[:page], per_page: 2)
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @favourite_exists = Favourite.where(content: @content , user: current_user) == [] ? false : true
  end

  def home
  end 
  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    @content.user = current_user
    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:title, :body, :video, :thumbnail)
    end

end
