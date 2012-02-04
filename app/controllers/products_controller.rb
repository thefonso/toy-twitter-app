class ProductsController < ApplicationController
  # GET /products
  # GET /products.json

  
  def index
    @products = Product.all    
    @savedtweets = Savetweets.order("created_at DESC").all
    @followersdb = Followers.all
    @trends = Twitter.local_trends(2487956)
    # Post tweets to Twitter
    if session[:user_id] != nil then      
      if params[:my_tweet] != nil then
        #sends only the first 140 chars out to Twitter.
        Twitter.update(params[:my_tweet][0...139])
        @most_recent_tweets = Twitter.home_timeline(count:3) 
      else
        #NOTE: there is a created_at value in the hash tag see 
        #https://dev.twitter.com/docs/api/1/get/statuses/home_timeline
        @most_recent_tweets = Twitter.home_timeline(count:3) 
        #this is grabbing the follower ids
        @followers = Twitter.follower_ids
        
      end     
    else
      # TODO display an error message
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    
    # @product = Product.new(params[:product])
    # 
    #     respond_to do |format|
    #       if @product.save
    #         format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #         format.json { render json: @product, status: :created, location: @product }
    #       else
    #         format.html { render action: "new" }
    #         format.json { render json: @product.errors, status: :unprocessable_entity }
    #       end
    #     end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end
end
