class Veiculo < ApplicationRecord

    validates :marca, :veiculo, presence: true
    validates :ano, length: {is: 4}, numericality: { only_integer: true }
    
end 
