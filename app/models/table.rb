class Table 

  def initialize(cols, data)  
	@columns = cols  
	@datasource = data  
  end 

  def to_html
  	view_paths = Rails::Application::Configuration.new(Rails.root).paths["app/views"]
	av_helper = ActionView::Base.new view_paths
	
	av_helper.render partial: 'controls/table', locals:{columns: @columns, datasource: @datasource}
  end
  
end