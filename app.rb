require_relative 'oficina.rb'
require_relative 'menu.rb'

class App
    def initialize
        $oficina = Oficina.new
        Menu.menu
    end
end

App.new