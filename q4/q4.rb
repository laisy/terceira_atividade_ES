entrada = []
File.open('entradaq4.txt').each_line do |line|
    line.slice! "\n"
    entrada.push(line)
end
dados = []
entrada.each do |indice|
    if indice == "9999" 
        break
    else
        dados.push(indice)
    end
end

pacientes = Hash.new
pacientes = {}

dados.each do |indice|
    codPaciente = indice.split(" ")[0] 
    dna = indice.split(" ")[1]
    pacientes[codPaciente] = dna 
end

contadorT = 0
maiorT = 0
saida = 0
pacientes.each do |codPaciente, dna|
    for char in 1..dna.length() do
        if char == 30
            if contadorT > maiorT
                maiorT = contadorT
                contadorT = 0
                saida = codPaciente
            else
                contadorT = 0
            end
        else    
            if dna[char] == "T"
                contadorT += 1
            end
        
        end
    end
end
p saida