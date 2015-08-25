module ApplicationHelper
	def get_model (id)
    @model = Model.find(id).title
  end
  def get_make (id)
    @make = Make.find(id).title
  end
end
