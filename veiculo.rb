class Veiculo
    attr_reader :modelo, :marca, :placa, :data_entrada

    def initialize(modelo, marca, placa)
        @modelo = modelo
        @placa = placa
        @marca = marca
        @data_entrada = Time.now 
    end
end