require 'rbconfig'

def clear
    os = RbConfig::CONFIG['host_os']
    if os.include?('linux')
        system('clear')
    
    elsif os.include?('mingw') || os.include?("mswin")
        system('cls')
    
    end
end

# Variables
n1 = 0
n2 = 0
ans = 0
ans_log = []
vars = Hash.new

# Main loop
loop do
    clear()

    # Actions available
    puts "Actions available:"
    puts "  - calc      | Calculator"
    puts "  - var       | Variable manager"
    puts "  - log       | View all answer logs"
    puts ""
    puts "  - quit      | Quit program"
    puts "-"
    action = gets.chomp.downcase

    # Calculator function
    if action == "calc"
        # First question, repeats until correct input is provided
        loop do
            clear()

            puts "Enter the first input"
            puts "-"
            n1 = gets.chomp.downcase

            # Checking if integer or float
            if n1.to_i.to_s == n1
                puts "integer"
                n1 = n1.to_i
                break

            elsif n1.to_f.to_s == n1
                puts "float"
                n1 = n1.to_f
                break

            else
                # Using variables

                if n1 == "ans"
                    puts "Using default ans variable with #{ans} value"
                    n1 = ans
                    sleep(2)
                    break

                elsif vars.key?(n1)
                    puts "Using #{n1} variable, with #{vars[n1]} value"
                    n1 = vars[n1]
                    sleep(2)
                    break

                else
                    puts "Not a valid input - Only existing variables, ints, floats and ans are supported"
                end
            end

            puts
        end

        # Second question, repeats until correct input is provided
        loop do
            clear()

            puts "Enter the second input"
            puts "-"
            n2 = gets.chomp.downcase

            # Check if integer or float
            if n2.to_i.to_s == n2
                puts "integer"
                n2 = n2.to_i
                break

            elsif n2.to_f.to_s == n2
                puts "float"
                n2 = n2.to_f
                break

            else
                # Using variables
                if n2 == "ans"
                    puts "Using default ans variable, with #{ans} value"
                    n2 = ans
                    sleep(2)
                    break

                elsif vars.key?(n2)
                    puts "Using #{n2} variable, with #{vars[n2]} value"
                    n2 = vars[n2]
                    sleep(2)
                    break

                else
                    puts "Not a valid input - Only existing variables, ints, floats and ans are supported"
                end
            end

            puts
        end

        clear()

        # Operation options
        puts "Select one from the following options:"
        puts "  - add   | Addition"
        puts "  - sub   | Subtraction"
        puts "  - div   | Division"
        puts "  - mul   | Multiplication"
        puts "  - mod   | Modulus"
        puts "-"
        operation = gets.chomp.downcase

        # Math operations
        if operation == "add"
            ans = n1 + n2
            clear()
            puts "Result of #{n1} + #{n2} = #{ans}"

        elsif operation == "sub"
            ans = n1 - n2
            clear()
            puts "Result of #{n1} - #{n2} = #{ans}"

        elsif operation == "div"
            ans = n1 / n2
            clear()
            puts "Result of #{n1} / #{n2} = #{ans}"

        elsif operation == "mul"
            ans = n1 * n2
            clear()
            puts "Result of #{n1} * #{n2} = #{ans}"
        
        elsif operation == "mod"
            ans = n1 % n2
            clear()
            puts "Result of #{n1} % #{n2} = #{ans}"

        else
            puts "Unknown operation"
        end

        ans_log.push(ans)

    # Variable function
    elsif action == "var"
        clear()

        # Enter variable name
        puts "Enter variable name"
        puts "-"
        var_name = gets.chomp.downcase
        var_data = 0

        # Enter variable data
        loop do
            clear()

            puts "Enter variable data"
            puts "-"
            var_data = gets.chomp.downcase
            
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
                    sleep(2)
                    break
                elsif vars.key?(var_data)
                    puts "Using #{var_data} variable, with #{vars[var_data]} value"
                    var_data = vars[var_data]
                    sleep(2)
                    break
                else
                    puts "Not a valid input - Only existing variables, ints, floats and ans are supported"
                end
            end
        end

        # Check if variable is already defined
        if vars.has_key?(var_name)
            clear()

            puts "Variable #{var_name} already defined, overwrite value? (y/n)"
            puts "-"
            proceed = gets.chomp.downcase

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
        clear()

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
        clear()

        puts "Exiting..."
        break
    
    # 404
    else
        clear()

        puts "Unknown action - action does not exist"
    end

    sleep(3)
end