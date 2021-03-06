class FoodsController < ApplicationController
 before_action :find_food, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, only: [:edit, :new]


def index
 
 if params[:category].blank?
  @foods=Food.all.order("created_at DESC") 
  else
 @category_id=Category.find_by(name: params[:category]).id
 @foods=Food.where(:category_id => @category_id).order("created_at DESC")
 end
 end

def  show
 if @food.reviews.blank?
 @average_review=0 
else
 @average_review=@food.reviews.average(:rating).round(2)
end

 end

def new
 if (current_user[:free])==true
 @food=current_user.foods.build
 5.times {@food.inputs.build} 
 @categories=Category.all.map {|c| [c.name,c.id] }
 else
 flash[:danger]="Your account is banned for posting"
redirect_to root_path 
  end
end

def create
   @food=current_user.foods.build(food_params)
   @food.category_id=params[:category_id]
   if @food.save
      redirect_to root_path
  else
    render 'new'
   end

 
end

def update
  @food.category_id=params[:category_id]

 if @food.update(food_params)
  redirect_to food_path(@food)
else
render 'edit'
end
end

def edit
 @categories=Category.all.map {|c| [c.name,c.id] }

end

def destroy
 @food.destroy
  redirect_to root_path

end


def news
end

def contact
end

def termsofuse
end


def privacypolicy
end

def advertise
end

private
  def food_params

 
   params.require(:food).permit(:name, :description, :creator, :category_id,:food_img,:directions,inputs_attributes: [:food_id,:ingredients,:_destroy])

  end

 def find_food

 @food=Food.find(params[:id])
 end

def users1_params
 params.require(:users1).permit(:id)
 end

#def freeaccount


 #users1=User.where(:free=>1)
# fid=users1.find_by(id: params[:id])
  #@users1.each {|user|  user[:id] }
 # users1.each do |usr1| usr1.foods end  
 #fid=user[:id]
        
 #@foods=Food.find(params[:id=>@fid])
# end


end
 
  


