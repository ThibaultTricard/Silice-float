$$if DIV_FLOAT == nil then
$$DIV_FLOAT = 1


// f3 = f1/f2
algorithm float_div(input  uint$float_size$ f1,
                    input  uint$float_size$ f2, 
                    output uint$float_size$ res, 
                    output uint1 ready,
                    input  uint1 wr) 
<autorun>{
    uint1 f3_s(0);
    int$exponant_size+1$ f1_e(0); 
    int$exponant_size+1$ f2_e(0);
    int$exponant_size+1$ f3_e(0);
    uint$exponant_size$ r_e(0);
    uint$mantissa_size+1$ r_m(0);
    uint$mantissa_size*2 + 2$ f1_m(0); 
    uint$mantissa_size*2 + 2$ f3_m(0); 
    uint$mantissa_size*2 + 2$ remain(0);

// +1 to fix loss of one bit of precision in the mantissa 
$$for i=0,mantissa_size+1 do
    uint$mantissa_size*2 + 2$ f2_m$i$ = uninitialized;
$$end

    uint$exponant_size$ bias        <: ~{1b1, $exponant_size-1$b0};
    while(1){
        if(wr){
            ready = 0;
            //sign
            f3_s = (f1[$float_size-1$,1] == f2[$float_size-1$,1]) ? 0 : 1; //sign of the result

            //exponent
            f1_e= f1[$mantissa_size$, $exponant_size$] -bias;
            f2_e= f2[$mantissa_size$, $exponant_size$] -bias;

            f3_e = (f1_e - f2_e) + bias;
            r_e = f3_e[0, $exponant_size$];

            //mantissa
            f1_m = {1b1, f1[0, $mantissa_size$], $mantissa_size+1$b0};
            f3_m = 0;
            // +1 to fix loss of one bit of precision in the mantissa 
            $$for i=0,mantissa_size+1 do 
                f2_m$i$ = {1b1, f2[0, $mantissa_size$]} << $i$;
            $$end

            remain = f1_m;
            $$for i=mantissa_size+1,0,-1 do
                ++:
                if(remain >= f2_m$i$){
                    remain = remain - f2_m$i$;
                    f3_m = f3_m + (1 << $i$); 
                }
            $$end
/*          __display("remain  : %b", remain);
            __display("shifted : %b", (f2_m0 >>1));*/
            if(remain > (f2_m0 >>1) ){
                r_m = (f3_m[$mantissa_size+1$,1] ? f3_m[1,$mantissa_size$] : f3_m[0,$mantissa_size$]) +1b1;
            }else{
                r_m = (f3_m[$mantissa_size+1$,1] ? f3_m[1,$mantissa_size$] : f3_m[0,$mantissa_size$]);
            }
            res = {f3_s,
            f3_m[$mantissa_size+1$,1] ? r_e : r_e - 1b1, 
            r_m[0,$mantissa_size$]};

            ready = 1;
        }
    }
}

$$end