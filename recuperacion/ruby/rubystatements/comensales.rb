#!/usr/bin/env ruby

class CubiertoIzquierda
	@@cubierto = "Izquierdo"
	def initialize
	@cubierto = @@cubierto
	end
	def cubiertoIzq?
	@cubierto
	end	
end

class CubiertoDerecha
	@@cubierto = "Derecho"
	def initialize
	@cubierto = @@cubierto
	end
	def cubiertoDer?
	@cubierto
	end	
end


def accion_comensal (numeroComensal, cubiertoI, cubiertoD)
	loop do
	sleep rand(8)
	puts "Comensal #{numeroComensal} ha cogido el cubierto #{cubiertoI} "
	sleep rand(8)
	puts "Comensal #{numeroComensal} ha cogido el cubierto #{cubiertoD} "
	sleep rand(8)
	puts "Comensal #{numeroComensal} comiendo"
	sleep rand(8)
	puts "Comensal #{numeroComensal} descansando"
	end
end

comensales = []
numero_comensal = 0

#puts "#{cubierto_izq} #{cubierto_der}\n"
cantidad_cubiertos = 0
cubierto_derecho_cogido = false

while comensales.length<4
 		comensales << Thread.new do
 		numero_comensal +=1
	cub1 = CubiertoIzquierda.new
	cub2 = CubiertoDerecha.new
	accion_comensal(numero_comensal, cub1.cubiertoIzq?, cub2.cubiertoDer?)
	end
end

comensales.each do |e|
e.join
end
