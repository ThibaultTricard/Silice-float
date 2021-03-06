$$if FLOAT_COMP == nil then
$$FLOAT_COMP = 1

algorithm float_inf(input uint$float_size$ f1, input uint$float_size$ f2, output uint1 inf){
    inf = 0;
    if(f1[$float_size-1$, 1] & ~f2[$float_size-1$, 1]){
        inf = 1;
    }else{
        if(f1[$mantissa_size$, $exponant_size$] < f2[$mantissa_size$, $exponant_size$]){
            inf = 1;
        }
    }
}

algorithm float_sup(input uint$float_size$ f1, input uint$float_size$ f2, output uint1 inf){
    inf = 0;
    if(~f1[$float_size-1$, 1] & f2[$float_size-1$, 1]){
        inf = 1;
    }else{
        if(f1[$mantissa_size$, $exponant_size$] > f2[$mantissa_size$, $exponant_size$]){
            inf = 1;
        }
    }
}

$$end