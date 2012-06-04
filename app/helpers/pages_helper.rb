module PagesHelper

def cat_right_img
	image_tag("cat.jpg", :alt => "Plaatje kat", :class => "cat_right")
end

def cat_left_img
	image_tag("cat.jpg", :alt => "Plaatje kat", :class => "cat_left")
end

end
