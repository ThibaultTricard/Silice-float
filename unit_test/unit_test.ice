$include('../src/float_def.ice')
$$uint_size = 32
$include('../src/uint_float_converter.ice')
$include('../src/float_comparison.ice')
$include('../src/float_add.ice')


algorithm main(output uint8 leds){
    uint$uint_size$_to_float to_float;
    float_to_uint$uint_size$ conv_prime;
    uint$uint_size$ u1(1);
    uint$uint_size$ u2(513);

    uint$uint_size$ u3(0);
    inf_float inf;
    add_float add;
    uint$float_size$ f1 = uninitialized;
    uint$float_size$ f2 = uninitialized;
    uint$float_size$ f3 = uninitialized;
    uint1 b = uninitialized;

    (f1)<-to_float<-(u1);
    (f2)<-to_float<-(u2);
    ++:
    f1 = {1b1,f1[0,$float_size-1$]};

    ++:
    (f3)<-add<-(f1,f2);
    ++:
    (u3)<-conv_prime<-(f3);
    __display("- %d                  = %b %b %b", u1, f1[$float_size-1$,1], f1[$mantissa_size$,$exponant_size$], f1[0,$mantissa_size$]);
    __display(" %d                  = %b %b %b", u2,f2[$float_size-1$,1], f2[$mantissa_size$,$exponant_size$], f2[0,$mantissa_size$]);
    __display(" %d +- %d     = %b %b %b", u2, u1,f3[$float_size-1$,1], f3[$mantissa_size$,$exponant_size$], f3[0,$mantissa_size$]);
    __display("\tres                  = %d", u3);
    
}