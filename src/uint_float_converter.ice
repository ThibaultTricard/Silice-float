$$if UINT_TO_FLOAT == nil then
$$UINT_TO_FLOAT = 1

algorithm uint$uint_size$_to_float(input uint$uint_size$ i, output uint$float_size$ f){
    uint1 s :=0;
    uint$exponant_size$ exponant = 0;
    uint$mantissa_size$ mantissa = 0;
    $$for i=uint_size-1,1,-1 do
        if(i[$i$,1]){
            exponant = {1b1, $exponant_size-1$d$i$} -1;
            mantissa = {i[0,$i$], $mantissa_size-i$d0};
        } else {
    $$end
        if(i[0,1]){
            exponant = {1b1, $exponant_size-1$d$0$} -1;
            mantissa = 0;
        }
    $$for i=0,uint_size-2 do
        }
    $$end
    f = {s, exponant, mantissa};
}


//equivalent to a ceil
algorithm float_to_uint$uint_size$(input uint$float_size$ f, output uint$uint_size$ i){
    if(f[$float_size-1$, 1]){
        i = 0;
    }
    else{
        uint$exponant_size$ exponant = 0;
        exponant = f[$mantissa_size$, $exponant_size-1$] + 1;
        $$for i=uint_size-1,1,-1 do
            if($i$ == exponant){
                i = (1 << exponant) +  f[$mantissa_size-i$, $i$];
            }
        $$end   
    }
}


$$end