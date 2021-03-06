$$if MUL_FLOAT == nil then
$$MUL_FLOAT = 1

algorithm float_mul(
    input uint$float_size$ f1,
    input uint$float_size$ f2, 
    output uint$float_size$ res,
    output uint1 ready,
    input  uint1 wr)
<autorun>{
    int$exponant_size+1$ e1         <: f1[$mantissa_size$, $exponant_size$];
    int$exponant_size+1$ e2         <: f2[$mantissa_size$, $exponant_size$];
    uint$mantissa_size +1$ m1       <: {1b1, f1[0, $mantissa_size$]};
    uint$mantissa_size +1$ m2       <: {1b1, f2[0, $mantissa_size$]};
    uint$exponant_size$ one_inv     <: {1b1, $exponant_size-1$b0};
    uint$exponant_size$ bias        <: ~{1b1, $exponant_size-1$b0};
    // result sign
    uint1 r_s                       <: f1[$float_size-1$,1] == f2[$float_size-1$,1] ? 1b0 : 1b1;
    uint$mantissa_size$ r_m(0);
    uint$exponant_size$ r_e(0);
    
    //mantissa multiplication setup
    uint$(mantissa_size +2)$ tmp(0);
    uint$(mantissa_size +1)$ r_0 <: m2[$mantissa_size$,1] ? m1 : $(mantissa_size +1)$b0;
$$for i=1,mantissa_size do
    uint$(mantissa_size +1)$ r_$i$ <: m2[$mantissa_size-i$,1] ? m1 >> $i$ : $(mantissa_size +1)$b0;
$$end


    always{
        if(wr){
            // multiplication of both mantissa
            tmp = 
        $$for i=0,mantissa_size-1 do
            r_$i$+
        $$end
            r_$mantissa_size$;

            //then we take 23 bits before the first bit to 1 as the result mantissa
            //the first bit to one can either be the strongest or the one before that
            r_m = tmp[$mantissa_size +1$,1] ? 
                        tmp[$1$, $mantissa_size$] : 
                        tmp[$0$, $mantissa_size$];
            r_e = (e1-bias) + (e2-bias) + bias + tmp[$mantissa_size +1$,1];

            res = {r_s,r_e,r_m};
            ready = 1;
        }
    }
}

$$end