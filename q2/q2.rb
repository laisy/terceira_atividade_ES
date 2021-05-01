entrada = []
File.open('entradaq2.txt').each_line do |line|
    line.slice! "\n"
    entrada.push(line)
end

lenMensagem = entrada.shift().to_i
mensagem = Hash.new
mensagem = {}

entrada.each do |indice|
    numero = indice.split(" ")[0] 
    letra = indice.split(" ")[1]
    mensagem[numero] = letra 
end

saida = ""
for char in 1..lenMensagem do
    saida += mensagem[char.to_s]
end
p saida