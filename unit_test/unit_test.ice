$include('../src/float_def.ice')
$$uint_size = 32
$include('../src/uint_float_converter.ice')
$include('../src/float_comparison.ice')


algorithm main(output uint8 leds){
    uint$uint_size$_to_float to_float;
    float_to_uint$uint_size$ conv_prime;
    inf_float inf;
    sup_float sup;
    uint$float_size$ f1 = uninitialized;
    uint$float_size$ f2 = uninitialized;
    uint1 b = uninitialized;
    (f1)<-to_float<-(129);
    (f2)<-to_float<-(680);

    (b)<-sup<-(f2,f1);
    
    if(b){
        __display("success");
    }
    else{
        __display("failled");
    }
    
}