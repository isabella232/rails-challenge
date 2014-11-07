class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index
    
    #@pictures = Picture.paginate(:page => params[:page], :per_page => 2)
    
    @pictures = Picture.page(params[:page]).per(2)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  def search
    @pictures = Picture.search(params[:query]).records
    render action: "index"
  end

  def show
    @picture = Picture.get(params[:id])
    @comment = Comment.new
    @comments = @picture.comments

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  def edit
    @picture = Picture.get(params[:id])
  end

  def create
    @picture = Picture.new(params[:picture])

    #Picture.import

    #@picture.__elasticsearch__.index_document

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @picture = Picture.get(params[:id])

    respond_to do |format|
      if @picture.update(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture = Picture.get(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end
end
