n1 = 0
n2 = 0
ans = 0
ans_log = []
vars = Hash.new
loop do
    system("cls")

    puts "Actions available:"
    puts "  - calc      | Calculator"
    puts "  - var       | Variable manager"
    puts "  - log       | View all answer logs"
    puts "  - quit      | Quit program"
    puts "-"
    action = gets.chomp

    # Calculator function
    if action == "calc"
        # First question, repeats until correct input is provided
        loop do
            system("cls")

            puts "Enter the first input"
            puts "-"
            n1 = gets.chomp

            if n1.to_i.to_s == n1
                puts "integer"
                n1 = n1.to_i
                break
            elsif n1.to_f.to_s == n1
                puts "float"
                n1 = n1.to_f
                break
            else
                if n1 == "ans"
                    puts "Using default ans variable with #{ans} value"
                    n1 = ans
                    break
                elsif vars.key?(n1)
                    puts "Using #{n1} variable, with #{vars[n1]} value"
                    n1 = vars[n1]
                    break
                else
                    puts "Not a valid input - Only existing variables, ints, floats and ans are supported"
                end
            end

            puts
        end

        # Second question, repeats until correct input is provided
        loop do
            system ("cls")

            puts "Enter the second input"
            puts "-"
            n2 = gets.chomp

            if n2.to_i.to_s == n2
                puts "integer"
                n2 = n2.to_i
                break
            elsif n2.to_f.to_s == n2
                puts "float"
                n2 = n2.to_f
                break
            else
                if n2 == "ans"
                    puts "Using default ans variable, with #{ans} value"
                    n2 = ans
                    break
                elsif vars.key?(n2)
                    puts "Using #{n2} variable, with #{vars[n2]} value"
                    n2 = vars[n2]
                    break
                else
                    puts "Not a valid input - Only existing variables, ints, floats and ans are supported"
                end
            end

            puts
        end

        system("cls")

        # Operation options
        puts "Select one from the following options:"
        puts "  - add   | Addition"
        puts "  - sub   | Subtraction"
        puts "  - div   | Division"
        puts "  - mul   | Multiplication"
        puts "-"
        operation = gets.chomp

        # Math operations
        if operation == "add"
            ans = n1 + n2
            system("cls")
            puts "Result of #{n1} + #{n2} = #{ans}"
        elsif operation == "sub"
            ans = n1 - n2
            system("cls")
            puts "Result of #{n1} - #{n2} = #{ans}"
        elsif operation == "div"
            ans = n1 / n2
            system("cls")
            puts "Result of #{n1} / #{n2} = #{ans}"
        elsif operation == "mul"
            ans = n1 * n2
            system("cls")
            puts "Result of #{n1} * #{n2} = #{ans}"
        else
            puts "Unknown operation"
        end

        ans_log.push(ans)

    # Variable function
    elsif action == "var"
        system("cls")

        # Enter variable name
        puts "Enter variable name"
        puts "-"
        var_name = gets.chomp
        var_data = 0

        # Enter variable data
        loop do
            system("cls")

            puts "Enter variable data"
            puts "-"
            var_data = gets.chomp
            if var_data.to_i.to_s == var_data
                puts "integer"
                var_data = var_data.to_i
                break
            elsif var_data.to_f.to_s == var_data
                puts "float"
                var_data = var_data.to_f
                break        
            else
                if var_data == "ans"
                    puts "Using default ans variable, with #{ans} value"
                    var_data = ans
                    break
                elsif vars.key?(var_data)
                    puts "Using #{var_data} variable, with #{vars[var_data]} value"
                    var_data = vars[var_data]
                    break
                else
                    puts "Not a valid input - Only existing variables, ints, floats and ans are supported"
                end
            end
        end

        # Check if variable is already defined
        if vars.has_key?(var_name)
            system("cls")

            puts "Variable #{var_name} already defined, overwrite value? (y/n)"
            puts "-"
            proceed = gets.chomp

            if proceed == "y"
                vars[var_name] = var_data
                puts "Overwrite successful"
            else
                puts "Action aborted."
            end
        else
            puts "-"
            vars[var_name] = var_data
            puts "Variable #{var_name} created, with value #{vars[var_name]}"
        end

    # Ans Log
    elsif action == "log"
        system("cls")

        puts "Answer log"
        if ans_log.length == 0
            puts "Log is empty"
        else
            num = 0
            for log in ans_log
                num += 1
                puts "Log for calculation #{num}: #{log}"
            end
        end
        
    # Quit
    elsif action == "quit"
        break
    
    # 404
    else
        system("cls")

        puts "Unknown action - action does not exist"
    end

    sleep(3)
end