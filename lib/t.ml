let rec t acc = 
	print_int acc ; print_string "\n" ; t(acc+1) ;;