function encoded_symbol = encode(out_vec)
    
    symbols = ["1" "2" "3" "4" "5" "6" "7" "8" "9" "-"  "("  ")"  "0"  "["  "]"  "+"  "="  "d"  "."  "exist"  "forall"  "forward_slash"  "geq"  "gt"  "int"  "leq"  "lt"  "m"  "n"  "neq"  "sum"  "x"  "y"  "z"]; 
    symbols = symbols';
    for i=1:length(out_vec)
        if out_vec(i)==1
            encoded_symbol = symbols(i);
            break
        end
    end


end
