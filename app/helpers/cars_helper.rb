module CarsHelper
	def get_safety_feature_title (id)
    @safety_feature = SafetyFeature.find(id).title
  end

  def get_comfort_interior_title (id)
    @comfort_interior = ComfortInterior.find(id).title
  end

  def get_color (id)
    @make = Color.find(id).title
  end

  def get_interior_design (id)
    @make = InteriorDesign.find(id).title
  end

  def get_interior_color (id)
    @make = InteriorColor.find(id).title
  end

end
