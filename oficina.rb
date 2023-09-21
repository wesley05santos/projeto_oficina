require_relative 'veiculo.rb'
require_relative 'menu.rb'

class Oficina
    attr_reader :listagem_carros

    def initialize
        @listagem_carros = []
    end

    def input_modelo
        puts "Modelo do Veículo:"
        modelo = gets.chomp
    end

    def input_marca
        puts "Marca do veículo"
        marca = gets.chomp
    end

    def input_placa
        puts "Placa do veículo: "
        placa = gets.chomp
    end

    def entrada_veiculo_oficina              
        @listagem_carros << Veiculo.new(input_modelo, input_marca, input_placa)
        puts "ENTRADA DO VEICULO REALIZADA COM SUCESSO!!!"    
        sleep(1)
        Menu.retorna_menu
    end

    def saida_veiculo_oficina
        if @listagem_carros.empty?
            puts "Não há veículos para serem removidos!"
            sleep(2)
            Menu.retorna_menu
        else
            puts "Digite a placa do veiculo: "
            placa = gets.chomp
            @listagem_carros.each do |veiculo|
                if veiculo.placa == placa
                    veiculo_removido = @listagem_carros.select { |veiculo| veiculo.placa == placa }
                    @listagem_carros.delete_if { |veiculo| veiculo.placa == placa }
                    data_saida = Time.now               
                    puts "SAIDA DO VEICULO REALIZADA COM SUCESSO!!!"
                    puts <<~EOF
                    "Veiculo: #{veiculo_removido.first.modelo}"
                    "Placa: #{veiculo_removido.first.placa}
                    "Data/Hora Entrada: #{veiculo_removido.first.data_entrada.strftime("%d-%m-%Y %H:%M")}
                    "Data/Hora Saida: #{data_saida.strftime("%d-%m-%Y %H:%M")}
                    EOF
                    sleep(3)
                    Menu.retorna_menu
                end
            end        
            unless @listagem_carros.any? { |veiculo| veiculo.placa == placa }
                puts "VEICULO NÃO ENCONTRADO!"
                sleep(2)
                saida_veiculo_oficina
            end
        end
    end

    def listar_veiculos_oficina
        if @listagem_carros.empty?
            puts "Não há veículos para serem removidos!"
            sleep(2)
            Menu.retorna_menu
        end
        @listagem_carros.each do |carro|
            puts "Veiculo: #{carro.modelo} / Placa: #{carro.placa} / Data Entrada: #{carro.data_entrada.strftime("%d-%m-%Y %H:%M")}"
        end
        puts "\n========================================"
        puts "Pressione 0(zero), para retornar ao menu"
        puts "========================================"
        resposta = gets.chomp    
        if resposta == "0"
            Menu.retorna_menu
        else
            puts "============================"
            puts "Opção inválida!"
            puts "============================"
            sleep(1)
            listar_veiculos_oficina
        end
    end
end