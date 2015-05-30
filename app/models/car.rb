class Car < ActiveRecord::Base
  has_many :car_safety_features, dependent: :destroy
  has_many :safety_features, through: :car_safety_features
  has_many :car_comfort_interiors, dependent: :destroy
  has_many :comfort_interior, through: :car_comfort_interiors
  has_many :car_images, dependent: :destroy 
  has_one :color
  has_one :interior_color
  has_one :interior_design
  has_one :make
  has_one :model
  validates :title, :car_make, :car_model, :year, :car_location, :contact_number, :gearbox_id, :color_id, :interior_design_id, :report, :car_images, presence: true
  validates :report_other, presence: true, if: :report_other?
  validates :car_images, length: { in: 1..8 }
  accepts_nested_attributes_for :car_images, :reject_if => :all_blank, :allow_destroy => true
  Gearbox = {"1" => "Manual", "2" => "Automatic", "3" => "Tiptronic"}
  REPORT = {"1" => "Accident Free", "2" => "Damaged", "3" => "Repaired", "4" => "Other"}
  def report_other?
    report === 4
  end
end
