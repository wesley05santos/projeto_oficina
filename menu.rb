require_relative 'oficina.rb'

class Menu
    def self.menu
        puts <<~EOF
        ============================
            OFICINA DO WS
        ============================  
        [1] DAR ENTRADA EM VEICULO
        [2] DAR SAIDA EM VEICULO
        [3] IMPRIMIR VEICULOS OFICINA  
        [9] FECHAR PROGRAMA    
        EOF
        self.chamar_dicionario
    end

    def self.dicionario
        {
            1 => -> {$oficina.entrada_veiculo_oficina},
            2 => -> {$oficina.saida_veiculo_oficina},
            3 => -> {$oficina.listar_veiculos_oficina},
            9 => -> {encerra_programa}      
        }
    end   

    def self.chamar_dicionario                     
        result = dicionario[gets.chomp.to_i]&.call    
        result ||=  funcao_invalida
    end

    def self.retorna_menu
        clear
        puts "============================"
        puts "Retornando ao Menu....."
        puts "============================"
        sleep(2)
        clear
        puts menu
    end

    def self.clear
        system("clear")
    end

    def self.funcao_invalida
        puts <<~EOF
        ============================
        Função digitada inválida!!!
        ============================        
        EOF
        sleep(1)
        retorna_menu
    end

    def self.encerra_programa
        puts "ENCERRANDO PROGRAMA....."
        sleep(3)            
        exit
    end
end