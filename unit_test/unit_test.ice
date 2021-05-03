$include('../src/float_def.ice')
$$uint_size = 32
$$int_size = 32
$include('../src/FPU_module.ice')


algorithm main(output uint8 leds){
    int$uint_size$ u1(1058);
    int$uint_size$ u2(323);
    
    
    uint$float_size$ f1 = uninitialized;
    uint$float_size$ f2 = uninitialized;

    uint$float_size$ sum = uninitialized;
    uint$float_size$ dif = uninitialized;
    uint$float_size$ mul = uninitialized;
    uint$float_size$ div = uninitialized;

    uint$float_size$ in1 = uninitialized; 
    uint$float_size$ in2 = uninitialized; 
    uint$float_size$ out = uninitialized; 
    uint3            funct = uninitialized;
    uint1            wr = uninitialized;
    uint1            busy = uninitialized;

    FPU_module FPU(
        in1   <: in1,
        in2   <: in2,
        out   :> out,
        funct <: funct,
        wr    <: wr,
        busy  :> busy
    );

    wr ::= 0;

    in1 = u1;
    wr =1;
    funct = 4;

    while(busy){}
    f1 = out;
    in1 = u2;
    funct = 4;
    wr=1;

    while(busy){}
    f2 = out;
    in1 = f1;
    in2 = f2;
    funct = 0;
    wr=1;

    while(busy){}
    sum = out;
    funct = 1;
    wr=1;

    while(busy){}
    dif = out;
    funct = 2;
    wr=1;

    while(busy){}
    mul = out;
    funct = 3;
    wr=1;

    while(busy){}
    div = out;
    

    __display(" u1  = %d" , u1);
    __display(" u2  = %d" , u2);
    __display(" f1  = %b %b %b",   f1[$float_size-1$,1],  f1[$mantissa_size$,$exponant_size$],  f1[0,$mantissa_size$]);
    __display(" f2  = %b %b %b",   f2[$float_size-1$,1],  f2[$mantissa_size$,$exponant_size$],  f2[0,$mantissa_size$]);
    __display(" sum = %b %b %b", sum[$float_size-1$,1], sum[$mantissa_size$,$exponant_size$], sum[0,$mantissa_size$]);
    __display(" dif = %b %b %b", dif[$float_size-1$,1], dif[$mantissa_size$,$exponant_size$], dif[0,$mantissa_size$]);
    __display(" mul = %b %b %b", mul[$float_size-1$,1], mul[$mantissa_size$,$exponant_size$], mul[0,$mantissa_size$]);
    __display(" div = %b %b %b", div[$float_size-1$,1], div[$mantissa_size$,$exponant_size$], div[0,$mantissa_size$]);

    
}