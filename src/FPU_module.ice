$$if FPU_MODULE == nil then
$$FPU_MODULE = 1

$include('../src/float_mul.ice')
$include('../src/float_add.ice')
$include('../src/float_div.ice')
$include('../src/int_float_converter.ice')

algorithm FPU_module(
    input  uint$float_size$ in1, 
    input  uint$float_size$ in2, 
    output uint$float_size$ out, 
    input  uint3            funct,
    input  uint1            wr,
    output uint1            busy)
<autorun>{
    uint$float_size$ res(0);
    uint$float_size$ r_sum(0);
    uint$float_size$ r_mul(0);
    uint$float_size$ r_div(0);
    uint$float_size$ r_f(0);
    uint$float_size$ r_i(0);
    float_add add(
        f1 <: in1,
        res:> r_sum);
    float_mul mul(
        f1 <: in1,
        f2 <: in2,
        res:> r_mul);
    float_div div(
        f1 <: in1,
        f2 <: in2,
        res:> r_div);
    int_to_float i2f(
        i <: in1,
        res:>r_f);
    float_to_int f2i(
        f <: in1,
        res:>r_i);
    uint3 lauched_func(0);
    
    always{
        if(wr & ~busy){
            switch(funct){
                case 0 : {
                    busy = 1;
                    add.wr = 1;
                    add.f2 = in2;
                }
                case 1 : {
                    uint$float_size$ tmp := {~(in2[$float_size-1$,1]), in2[0,$float_size-1$]}; // no substraction so we invert the sign of the second float
                    busy = 1;
                    add.wr = 1;
                    add.f2 = tmp;
                }
                case 2 : {
                    busy = 1;
                    mul.wr = 1;
                }
                case 3 : {
                    busy = 1;
                    div.wr = 1;
                }
                case 4 : {
                    busy = 1;
                    i2f.wr = 1;
                }
                case 5 : {
                    busy = 1;
                    f2i.wr = 1;
                    __display("f2i launched : %d", in1);
                }
                default :{

                }
            }
            lauched_func = funct;
        }
        else {
            if (busy){
                switch(lauched_func){
                    case 0 : {
                        if(add.ready){
                            res = r_sum;
                            add.wr =0;
                            busy = 0;
                        }
                    }
                    case 1 : {
                        if(add.ready){
                            res = r_sum;
                            add.wr =0;
                            busy = 0;
                        }
                    }
                    case 2 : {
                        if(mul.ready){
                            res = r_mul;
                            mul.wr =0;
                            busy = 0;
                        }
                    }
                    case 3 : {
                        if(div.ready){  
                            res = r_div;
                            div.wr = 0;
                            busy = 0;
                        }
                    }
                    case 4 : {
                        if(i2f.ready){
                            res = r_f;
                            i2f.wr = 0;
                            busy = 0;
                            __display("i2f ready : %b", res);
                        }
                    }
                    case 5 : {
                        if(f2i.ready){
                            res = r_i;
                            f2i.wr = 0;
                            busy = 0;
                        }
                    }   
                    default :{
                        busy =1;
                    }
                }
            }
        }
        out = res;
    }
}

$$end