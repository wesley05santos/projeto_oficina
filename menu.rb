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
        self.funcao
    end

    def self.funcao
        puts "\nDigite a função desejada: "
        codigo_funcao = gets.chomp.to_i
        if codigo_funcao == 1
            $oficina.entrada_veiculo_oficina
        elsif codigo_funcao == 2
            $oficina.saida_veiculo_oficina
        elsif codigo_funcao == 3
            $oficina.listar_veiculos_oficina
        elsif codigo_funcao == 9
            puts "ENCERRANDO PROGRAMA....."
            sleep(3)            
            exit
        else
            funcao_invalida
        end
    end

    # def self.dicionario
    #     {
    #         # 1: -> {entrada_veiculo_oficina},
    #         # 2: -> {saida_veiculo_oficina},
    #         # 3: -> {listar_veiculos_oficina},
    #         {codigo: 9: funcao: teste}      
    #     }
    # end   

    # def self.chamar_dicionario                     
    #     result = dicionario[gets.chomp.to_sym]
    #     binding.irb       
    #     result ||=  funcao_invalida
    # end

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
end