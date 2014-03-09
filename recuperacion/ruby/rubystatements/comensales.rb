#!/usr/bin/env ruby


def accion_comensal (numeroComensal)
	loop do
	coger_cubierto(numeroComensal)
	if(@@cantidad_cubiertos == 2)
	sleep rand 8
	puts "Comensal #{numeroComensal} comiendo"
	sleep rand 8
	puts "Comensal #{numeroComensal} descansando"
end
	end
end

@@cantidad_cubiertos = 0

def coger_cubierto (nComensal)
	while @@cantidad_cubiertos < 2
	@@cantidad_cubiertos +=1
	puts "Comensal #{nComensal} ha cogido el cubierto #{@@cantidad_cubiertos}"
	sleep rand 5
	@@cantidad_cubiertos = 0
	end
end

comensales = []
numero_comensal = 0

while comensales.length<4
 		comensales << Thread.new do
 		numero_comensal +=1
	accion_comensal(numero_comensal)
	end
end

comensales.each do |e|
e.join
end
