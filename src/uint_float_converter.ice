$$if UINT_TO_FLOAT == nil then
$$UINT_TO_FLOAT = 1

algorithm uint_to_float(input uint$uint_size$ u, output uint$float_size$ f){
    uint1 s <: 0;
    uint$exponant_size$ exponant = 0;
    uint$mantissa_size$ mantissa = 0;
    $$for i=uint_size-1,1,-1 do
        if(u[$i$,1]){
            exponant = {1b1, $exponant_size-1$d$i$} -1;
            $$ending=i
            $$size=math.min(ending,mantissa_size)
            $$start=(ending-size)
            $$padding=math.max(mantissa_size-size,0)
            $$if padding==0 then
            mantissa = u[$start$,$size$];
            $$else
            mantissa = {u[$start$,$size$], $mantissa_size-i$d0};
            $$end
        } else {
    $$end
        if(u[0,1]){
            exponant = {1b1, $exponant_size-1$d$0$} -1;
            mantissa = 0;
        }
    $$for i=0,uint_size-2 do
        }
    $$end
    f = {s, exponant, mantissa};
}


//equivalent to a ceil
algorithm float_to_uint(input uint$float_size$ f, output uint$uint_size$ u){
    uint$exponant_size$ one_exponent <: {1b1,$exponant_size-1$b0};
    uint$exponant_size$ exponant <: f[$mantissa_size$, $exponant_size$] + 1;
    u = 0;

    if(f[$float_size-1$, 1] ){
        u = 0;
    }
    else{
        if(exponant[$exponant_size-1$, 1]){
            if(exponant == one_exponent){
                u =1;
            }else{
                $$for i=uint_size-1,1,-1 do
                if($i$ == exponant[0,$exponant_size-1$]){
                    $$if i == 0 then
                    u = (1 << $i$);
                    $$else
                    $$start = math.max(mantissa_size-i,0)
                    $$size = math.min(i, mantissa_size)
                    u = (1 << $i$) +  f[$start$, $size$];
                    $$end   
                }else{
                $$end  
                $$for i=uint_size-1,1,-1 do
                }
                $$end
            }
        }
    }
}


$$end