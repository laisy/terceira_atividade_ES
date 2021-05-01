require 'time'

class Time
    def humanize
        minutos = self.min
        horas = self.strftime("%I")

        if horas == "12"
             horas = self.strftime("%I %p")
        end

        horarios = {"1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", "8" => "eight", "9" => "nine", "10" => "ten", "11" => "eleven", "12 PM" =>  "twelve", "12 AM" => "midnight", "13" => "one"}

            #condição 1
            if (minutos < 15)
                    puts "About #{horarios[horas]}"

            #condição 2
            elsif (minutos >= 15 && minutos <= 30)

                if horas == "12 AM" || horas == "12 PM"
                    puts "About #{self.strftime("%I")}:30"
                else
                    puts "About #{horas}:30"
                end

            #condição 3
            elsif (minutos > 30 && minutos < 45)
                puts "About half past #{horarios[horas]}"

            #condição 4
            elsif (minutos >= 45 && minutos < 55)
                puts "About #{horarios[calcularHora(horas)]}"

            #condição 5
            else
                puts "About #{horarios[calcularHora(horas)]}"
            end

    end

    def calcularHora(horas)
        if horas == "12 AM" || horas == "12 PM"
            var = self.strftime("%I")
            var = var.to_i + 1
            var = var.to_s
            return var

        elsif self.strftime("%I %p") == "11 PM" || self.hour == "23"
            horas = self.strftime("%I")
            var = horas.to_i + 1
            var = var.to_s + " AM"
            return var

        elsif self.strftime("%I %p") == "11 AM" || self.hour == "11"
            horas = self.strftime("%I")
            var = horas.to_i + 1
            var = var.to_s + " PM"
            return var

        else
            var = horas.to_i + 1
            var = var.to_s
            return var
        end
    end

end

horarios = []

File.open('entradaq1.txt').each_line do |line|
    line.slice! "\n"
    horarios.push(line)
end

horarios.each {|tempo| Time.parse(tempo).humanize}
