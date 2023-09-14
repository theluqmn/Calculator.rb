n1 = 0
n2 = 0
ans = 0
vars = Hash.new
loop do
    puts "-"
    puts "Actions available:"
    puts "  - calc      | Calculator"
    puts "  - var       | Variable manager"
    puts "  - quit      | Quit"
    action = gets.chomp

    # Calculator function
    if action == "calc"
        # First question, repeats until correct input is provided
        loop do
            puts "-"
            puts "Enter the first input"
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
                    puts "Using #{n1} variable"
                    n1 = vars[n1]
                    break
                else
                    puts "Not a valid input"
                end
            end

            puts
        end

        # Second question, repeats until correct input is provided
        loop do
            puts "-"
            puts "Enter the second input"
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
                    puts "Using default ans variable with #{ans} value"
                    n2 = ans
                    break
                elsif vars.key?(n2)
                    puts "Using #{n2} variable"
                    n2 = vars[n2]
                    break
                else
                    puts "Not a valid input"
                end
            end

            puts
        end

        # Operation options
        puts "-"
        puts "Select one from the following options:"
        puts "  - add   | Addition"
        puts "  - sub   | Subtraction"
        puts "  - div   | Division"
        puts "  - mul   | Multiplication"
        operation = gets.chomp

        # Math operations
        if operation == "add"
            ans = n1 + n2
            puts "Result of #{n1} + #{n2} = #{ans}"
        elsif operation == "sub"
            ans = n1 - n2
            puts "Result of #{n1} - #{n2} = #{ans}"
        elsif operation == "div"
            ans = n1 / n2
            puts "Result of #{n1} / #{n2} = #{ans}"
        elsif operation == "mul"
            ans = n1 * n2
            puts "Result of #{n1} * #{n2} = #{ans}"
        else
            puts "Unknown operation"
        end
    end

    # Variable function
    if action == "var"
        # Enter variable name
        puts "-"
        puts "Enter variable name"
        var_name = gets.chomp
        var_data = 0

        # Enter variable data
        loop do
            puts "-"
            puts "Enter variable data"
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
                    puts "Using default ans variable with #{ans} value"
                    var_data = ans
                    break
                elsif vars.key?(var_data)
                    puts "Using #{var_data} variable"
                    var_data = vars[:var_data]
                    break
                else
                    puts "Not a valid input"
                end
            end
        end

        # Check if variable is already defined
        if vars.has_key?(var_name)
            puts "-"
            puts "Variable #{var_name} already defined, overwrite value? (y/n)"
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
            puts "Variable #{var_name} created, with value #{var_data}"
        end
    end

    # Quit
    if action == "quit"
        break
    end
end