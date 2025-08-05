class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  belongs_to :rol, class_name: 'Role', optional: true
  has_many :registro_precios, dependent: :destroy
  has_many :lista_compras, dependent: :destroy
  has_many :notificacions, dependent: :destroy
  has_one :preferencium, dependent: :destroy
  has_one :moderador, dependent: :destroy
  has_one :administrador, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :ombre_usuario, presence: true

  # Métodos para verificar roles
  def admin?
    rol&.name == "Administrador"
  end

  def moderador?
    rol&.name == "Moderador"
  end

  def usuario?
    rol&.name == "Usuario"
  end
end
