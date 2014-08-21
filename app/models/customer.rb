class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  
  before_validation :downcase_email
  before_validation :upcase_state

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/, allow_blank: true}
  validates :state, inclusion: { in: %w(AK AL AR AZ CA CO CT DE FL GA HI ID IL IN IA AS KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY),
    message: "%{value} is not a valid state" }
  validates :zip_code, format: { with: /\d(5,)/, allow_blank: true }


  def downcase_email
    self.email = email.to_s.downcase
   end 
   
   def upcase_state
    self.state = state.to_s.upcase
   end 
end
