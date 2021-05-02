#Exiba a quantidade de macacos, o peso médio dos tigres e a quantidade de cobras que vieram da Venezuela.
entrada = []
File.open('entradaq3.txt').each_line do |line|
    line.slice! "\n"
    entrada.push(line)
end
dados = []
entrada.each do |indice|
    if indice.upcase == "PARAR" 
        break
    else
        dados.push(indice)
    end
end

quantMacacos = 0
contadorTigres = 0
peso = 0.0
quantCobrasVen = 0

dados.each_with_index do |item, index|
    if item.capitalize == "Macaco"
        quantMacacos += 1
    end
    if item.capitalize == "Tigre"
        contadorTigres += 1
        peso += dados[index+1].to_f
    end
    if item.capitalize == "Cobra"
        if dados[index+2].capitalize == "Venezuela"
            quantCobrasVen += 1
        end
    end
end

if contadorTigres > 0
    pesoMedioTigre =  peso/contadorTigres
end

p quantMacacos
p pesoMedioTigre
p quantCobrasVen
