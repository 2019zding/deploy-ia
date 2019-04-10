class StaticPagesController < ApplicationController
	@@images = [
  		"https://thejournal.com/articles/2012/11/06/~/media/EDU/THEJournal/Images/2012/11/20121101deanza570%202.ashx",
  		"https://cdn.iste.org/www-root/2018-09/img_id_587.png?RRltQvsST3OMVPp9yg42F95vU0Xl722e"  	
  	]

  	@@images2 = [
  	"https://static01.nyt.com/images/2012/10/22/education/22schools_2/22schools_2-jumbo.jpg",
	  "https://c8.alamy.com/comp/C96J44/two-teenage-secondary-school-girls-playing-electronic-digital-keyboards-C96J44.jpg"  	
	]

  	@@images3 =[
  	"https://i2.cdn.turner.com/cnn/dam/assets/120120071257-p-tech-story-top.jpg",
  	"https://www.rcsdk12.org/cms/lib/NY01001156/Centricity/ModuleInstance/32196/large/banner_0008_Calebparkerphotography-_Y7A0349.jpg"
  	]
  def home
    # method for randomizing the images that can be seen on the homepage
    # every time the homepage is refreshed
  	@random = @@images.sample
  	@random2 = @@images2.sample
  	@random3 = @@images3.sample
  end

  def middleSchool
  end

  def highSchool
  end

  def admin
  end
end
