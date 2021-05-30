$$if INT_TO_FLOAT == nil then
$$INT_TO_FLOAT = 1

algorithm int_to_float(input int$int_size$ i,
                       output uint$float_size$ res, 
                       output uint1 ready,
                       input  uint1 wr)
<autorun>{
    uint$int_size$ u <: i[$int_size-1$,1] ? ((~i)+1) : i;
    uint1 s <: i[$int_size-1$,1];
    uint$exponant_size$ exponant = 0;
    uint$mantissa_size$ mantissa = 0;
    always{
        if(wr){
            uint1 rounding_up(0);
            $$for i=int_size-1,1,-1 do
                if(u[$i$,1]){
                    exponant = {1b1, $exponant_size-1$d$i$} -1;
                    $$ending=i
                    $$size=math.min(ending,mantissa_size)
                    $$start=(ending-size)
                    $$padding=math.max(mantissa_size-size,0)
                    $$if start > 0 then
                        rounding_up = u[$start-1$,1];
                    $$end
                    $$if padding==0 then
                    mantissa = u[$start$,$size$] + rounding_up;
                    $$else
                    mantissa = {u[$start$,$size$], $mantissa_size-i$d0} + rounding_up;
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
            res = {s, exponant, mantissa};
            ready = 1;
        }
    }
}

algorithm float_to_int(
    input  uint$float_size$ f, 
    output int$int_size$ res, 
    output uint1 ready,
    input  uint1 wr)
 <autorun>{
    uint$exponant_size$ one_exponent <: {1b1,$exponant_size-1$b0};
    uint$exponant_size$ exponant <: f[$mantissa_size$, $exponant_size$] + 1;
    uint$int_size$  u = 0;
    always{
        if(wr){
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
            res = f[$float_size-1$,1] ? (~u)+1 : u;
            ready = 1;
        }
    }
    
}

$$end