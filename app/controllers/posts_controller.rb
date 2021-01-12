class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def home
  end

  
  def index
    @posts = Post.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    @hokkaidou = Post.where(place: "北海道")
    @touhoku = Post.where(place: ["青森県","秋田県","山形県","岩手県","宮城県","福島県"])
    @kanntou = Post.where(place: ["東京都","神奈川県","千葉県","群馬県","栃木県","茨城県"])
    @chuubu = Post.where(place: ["愛知県","静岡県","長野県","岐阜県","新潟県","富山県","石川県","福井県","山梨県"])
    @kannsai = Post.where(place: ["京都府","大阪府","兵庫県","滋賀県","奈良県","和歌山県","三重県"])
    @shikochuu = Post.where(place: ["岡山県","鳥取県","広島県","島根県","山口県","香川県","徳島県","高知県","愛媛県"])
    @kyuushuu = Post.where(place: ["福岡県","佐賀県","大分県","熊本県","宮崎県","鹿児島県","長崎県"])
    @okinawa = Post.where(place: "沖縄県")
  end
  
  def hokkaidou
    @hokkaidou = Post.where(place: "北海道")
  end

  def touhoku
    @touhoku = Post.where(place: ["青森県","秋田県","山形県","岩手県","宮城県","福島県"])
  end

  def kanntou
    @kanntou = Post.where(place: ["東京都","神奈川県","千葉県","群馬県","栃木県","茨城県"])
  end

  def chuubu
    @chuubu = Post.where(place: ["愛知県","静岡県","長野県","岐阜県","新潟県","富山県","石川県","福井県","山梨県"])
  end

  def kannsai
    @kannsai = Post.where(place: ["京都府","大阪府","兵庫県","滋賀県","奈良県","和歌山県","三重県"])
  end

  def shikochuu
    @shikochuu = Post.where(place: ["岡山県","鳥取県","広島県","島根県","山口県","香川県","徳島県","高知県","愛媛県"])
  end

  def kyuushuu
    @kyuushuu = Post.where(place: ["福岡県","佐賀県","大分県","熊本県","宮崎県","鹿児島県","長崎県"])
  end

  def okinawa
    @okinawa = Post.where(place: "沖縄県")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to :action => "show", :id => @post.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :content, :address, :latitude, :longitude, :user_id, :rink, :place, :color)
  end
end





