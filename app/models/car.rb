class Car < ActiveRecord::Base
  has_many :car_safety_features, dependent: :destroy
  has_many :safety_features, through: :car_safety_features
  has_many :car_comfort_interiors, dependent: :destroy
  has_many :comfort_interiors, through: :car_comfort_interiors
  has_many :car_images, dependent: :destroy
  has_one :color
  has_one :interior_color
  has_one :interior_design
  has_one :make
  has_one :model
  belongs_to :user
  validates :title, :car_make, :car_model, :year, :car_location, :contact_number, :gearbox_id, :color_id, :interior_design_id, :report, :car_images, presence: true
  validates :report_other, presence: true, if: :report_other?
  validates :car_images, length: { in: 1..12 }
  accepts_nested_attributes_for :car_images, :reject_if => :all_blank, :allow_destroy => true
  Gearbox = {"1" => "manual", "2" => "automatic"}
  FUELTYPE = {"1" => "petrol", "2" => "diesel", "3" => "hybrid"}
  REPORT = {"1" => "accident_free", "2" => "damaged", "3" => "repaired", "4" => "other"}
  City = {
  "1" => "Amman",
  "2" => "Zarqa",
  "3" => "Irbid",
  "4" => "Aqaba",
  "5" => "as-Salt",
  "6" => "Ar Ramtha",
  "7" => "Madaba",
  "8" => "Mafraq",
  "9" => "Jerash",
  "10" => "Ma'an",
  "11" => "Tafilah",
  "12" => "Karak",
  "13" => "Ajloun"
}
  def report_other?
    report === 4
  end
  searchable do
    integer :car_make
    integer :car_model
    integer :cubic_capacity
    integer  :year
    integer :mileage
    integer :gearbox_id
    integer :fuel_type
    integer :color_id
    integer :report
    integer :price
    date :created_at
    integer :comfort_interior_ids, multiple: true do
      comfort_interiors.map(&:id)
    end
    integer :safety_feature_ids, multiple: true do
      safety_features.map(&:id)
    end
  end
end
