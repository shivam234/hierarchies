class Employee < ActiveRecord::Base
  has_one :manager, :class_name => "Employee", :foreign_key => :id, :primary_key => :manager_id

  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  before_save :encrypt_password

  def get_children
    child = []
    child << Employee.where(manager_id: self.id)
    child.flatten!
  end

  def self.authenticate(email, password)
    employee = find_by_email(email)
    if employee && employee.password_hash == BCrypt::Engine.hash_secret(password, employee.password_salt)
      employee
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
