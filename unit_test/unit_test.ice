$include('../src/float_def.ice')
$$uint_size = 32
$include('../src/uint_float_converter.ice')
$include('../src/float_comparison.ice')
$include('../src/float_mul.ice')


algorithm main(output uint8 leds){
    uint_to_float to_float;
    float_to_uint to_uint;
    uint$uint_size$ u1(127);
    uint$uint_size$ u2(1);

    uint$uint_size$ u3(0);
    inf_float inf;
    mul_float mul;
    uint$float_size$ f1 = uninitialized;
    uint$float_size$ f2 = uninitialized;
    uint$float_size$ f3 = uninitialized;
    uint$float_size$ one = $float_size$b00111111100000000000000000000000;
    uint1 b = uninitialized;

    
    //f1 = $float_size$b00111110101101101000000101100111;
    //f2 = $float_size$b01000010111111100000000000000000;
    (f1)<-to_float<-(u1);
    ++:
    (f2)<-to_float<-(u2);
    ++:
    (f3)<-mul<-(f1,f2);
    ++:
    (u3)<-to_uint<-(f3);
    __display(" %d                  = %b %b %b", u1, f1[$float_size-1$,1], f1[$mantissa_size$,$exponant_size$], f1[0,$mantissa_size$]);
    __display(" %d                      = %b %b %b",u2, f2[$float_size-1$,1], f2[$mantissa_size$,$exponant_size$], f2[0,$mantissa_size$]);
    __display(" %d * %d          = %b %b %b", u1, u2 ,f3[$float_size-1$,1], f3[$mantissa_size$,$exponant_size$], f3[0,$mantissa_size$]);
    __display(" %d ", u3);
    
}