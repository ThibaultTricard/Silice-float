$$if ADD_FLOAT == nil then
$$ADD_FLOAT = 1

$include('float_comparison.ice')

//no subtract operation, to substract invert the sign bit of the secong float

algorithm float_add(input uint$float_size$ f1, 
                    input uint$float_size$ f2, 
                    output uint$float_size$ res, 
                    output uint1 ready,
                    input  uint1 wr
)<autorun>{
    uint$mantissa_size * 2+2$ max_mantissa(0);
    uint$mantissa_size * 2+2$ min_mantissa(0);

    uint$exponant_size$ max_exponant(0);
    
    uint$mantissa_size * 2+2$ sum_mantissa(0);

    uint$exponant_size$ dif_exponent(0);
    uint1 f1_inf_f2 (0);
    float_inf inf;
    uint$float_size$ tmp_res(0);

    always{
        ready = 0;
        if(wr){
            f1_inf_f2 = (f1[$mantissa_size$, $exponant_size$] < f2[$mantissa_size$, $exponant_size$]) || ((f1[$mantissa_size$, $exponant_size$] == f2[$mantissa_size$, $exponant_size$]) && (f1[0, $mantissa_size$] <= f2[0, $mantissa_size$]));
            dif_exponent = (f1_inf_f2)?
                        (f2[$mantissa_size$,$exponant_size$]) - (f1[$mantissa_size$,$exponant_size$]) :
                        (f1[$mantissa_size$,$exponant_size$]) - (f2[$mantissa_size$,$exponant_size$]);

            
            max_exponant = (f1_inf_f2)?
                        (f2[$mantissa_size$,$exponant_size$]):
                        (f1[$mantissa_size$,$exponant_size$]);

            
            $$for i=0, mantissa_size-1 do
                if($i$ == dif_exponent){
                    if(f1_inf_f2){
                        min_mantissa = {$i$b0,f1[0, $mantissa_size$], $mantissa_size - i$b0}  | {1b1, $mantissa_size*2 -i$b0}; 
                    }else{
                        min_mantissa = {$i$b0,f2[0, $mantissa_size$], $mantissa_size - i$b0}  | {1b1, $mantissa_size*2 -i$b0};
                    }     

                }else{
            $$end
            $$for i=0, mantissa_size-1 do
                }
            $$end
            max_mantissa = (f1_inf_f2)?
                                {1b1,f2[0, $mantissa_size$], $mantissa_size$b0}: 
                                {1b1,f1[0, $mantissa_size$], $mantissa_size$b0};
            if(f1[$float_size-1$,1]==f2[$float_size-1$,1]){  
                sum_mantissa = max_mantissa + min_mantissa;
                if(sum_mantissa[$mantissa_size * 2+1$,1]){
                    tmp_res ={f1[$float_size-1$,1], max_exponant+1b1, sum_mantissa[$mantissa_size+1$,$mantissa_size$]};
                }else{
                    tmp_res ={f1[$float_size-1$,1], max_exponant, sum_mantissa[$mantissa_size$,$mantissa_size$]};
                }
            }
            else{
                uint1 res_sign(0);
                uint$exponant_size$ carry(0);
                uint$mantissa_size$ res_mantissa(0);

                res_sign = f1_inf_f2 ? f2[$float_size-1$,1] : f1[$float_size-1$,1];
                sum_mantissa = max_mantissa - min_mantissa;
            
            $$for i=mantissa_size*2,0,-1  do
                if(sum_mantissa[$i$,1]){
                    carry = $mantissa_size*2 - i$;
                    $$start = math.max(i-mantissa_size,0)
                    $$size = i - start 
                    $$padding = mantissa_size-(size)
                    
                    $$if padding==mantissa_size then
                        res_mantissa = 0;
                    $$else
                        $$if padding==0 then
                        res_mantissa = sum_mantissa[$start$,$size$];  
                        $$else
                        res_mantissa = {sum_mantissa[$start$,$size$],$padding$b0};
                        $$end
                    $$end
                }
                else{
            $$end
                    if(sum_mantissa == $mantissa_size * 2+2$b0 && dif_exponent == $exponant_size$b0){
                        carry = max_exponant;
                    }
            $$for i=mantissa_size*2,0,-1  do
                }
            $$end

                tmp_res ={res_sign, max_exponant-carry, res_mantissa};
            }
            ready = 1;
        }
        res = tmp_res;  
    }
}

$$end