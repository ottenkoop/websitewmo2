class PagesController < ApplicationController

def home
	#@posts = Post.limit(2).order('id desc').all
	@posts= Post.where(category_id: params[:category_id]).limit(2).order('id desc').all
	#@posts = Post.where("Category = ?", 'algemeen').all
	#WYSIWYG editor via jquery of misschien een gem ? niet vergeten 
	#Waarom is de teaxaeara resizelble?
	# alle CMS via posts laten verlopen, kan mooi zo.
	#Script vinden voor FAQ inschuiven of verspringen.
	#Ander script zoeken voor constrast? 
	#Kijken naar de internalization gem 
  	@title = "Home"
  end

 def contact
 	@questions = Post.where(category_id: params[:category_id]).all
	@categories = Category.all
	@catname = Post.where(category_id: params[:category_id]).limit(1).order('id desc').all
	@title = "Contact"
 end

  def actual
 	@actual = Post.where(category_id: params[:category_id]).order('id desc').all
 	@catname = Post.where(category_id: params[:category_id]).limit(1).order('id desc').all
 	@title = "Actueel"
 end

 def actual_news
 	@actual = Post.where(category_id: params[:category_id]).order('id desc').all
 	@catname = Post.where(category_id: params[:category_id]).limit(1).order('id desc').all
 	@title = "Actueel"
 end

def info_shorts
	@shorts = Post.where(category_id: params[:category_id]).order('id desc').all
	@catname = Post.where(category_id: params[:category_id]).limit(1).order('id desc').all
	@title = "Afkortingen"
end
end
