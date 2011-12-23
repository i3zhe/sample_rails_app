module PagesHelper
  def title 
    base_title = "sample"
    if @title.nil?
      base_title
    else
      base_title + " | " + @title
    end
      

  end
end
