#!/usr/bin/env ruby

#A medida que van entrando clientes nuevos a un restaurante
#Se va formando un cola para pedir en un cajero automatico
#Cuando han realizado el pedido salen y se situan en la cola de pago
#Entre 5 empleados del restaurante se atiende a los clientes
#Los clientes salen del restaurante

class Cliente
        @@nCliente = 0
        def initialize
                @@nCliente += 1
                @nCliente = @@nCliente
        end
        def nCliente?
                @nCliente
        end
end

class Empleado
        @@nEmpleado = 0
        def initialize
                @@nEmpleado += 1
                @nEmpleado = @@nEmpleado
        end
        def nEmpleado?
                @nEmpleado
        end
end

clientes = []
colaPago = []
colaPedido = []
empleados = []
numero_empleado = 0

creando_cliente = Thread.new do
        loop do
                cliente = Cliente.new
                clientes.push(cliente.nCliente?)
                sleep 1
        end
end

cola_pedido = Thread.new do
	loop do
        while !clientes.empty?
                cliente_llega = clientes.shift
                colaPedido.push(cliente_llega)
                puts "El cliente #{cliente_llega} ha llegado a la cola de pedido"
                puts "Estado de la cola de pedido: #{colaPedido.length}"
                sleep rand(5) + 1
        end
	end
end

cola_pago = Thread.new do
        loop do
                if !colaPedido.empty?
			sleep rand(3) + 1
                        cliente_paga = colaPedido.shift
                        puts "El cliente #{cliente_paga} ha salido de la cola de pedido"
                        sleep rand(5) + 2
                        colaPago.push(cliente_paga)
                        puts "El cliente #{cliente_paga} ha llegado a la cola de pago"
                        puts "Estado de la cola de pago: #{colaPago.length}"
                        sleep rand(5) + 2
                end
        end
end

while empleados.length < 5
        empleados << Thread.new do
                empleado = Empleado.new
		sleep 3
                loop do
                        while !colaPago.empty?
                                cliente_atendido = colaPago.shift
                                puts "El empleado #{empleado.nEmpleado?} esta atendiendo al cliente #{cliente_atendido}"
                                sleep rand(5) + 2
                                puts "El cliente #{cliente_atendido} ha salido del restaurante"
                        end
                end
        end
end

creando_cliente.join
cola_pago.join
cola_pedido.join
empleados.each do |empleado|
        empleado.join
end


