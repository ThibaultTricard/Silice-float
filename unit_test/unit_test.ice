$include('../src/float_def.ice')
$$uint_size = 32
$$int_size = 32
$include('../src/FPU_module.ice')
algorithm main(output uint8 leds){
// initialisation
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
      busy  :> busy,
  );
  wr ::= 0;

// uint_to_float
  funct = 4;
  in1 = 0;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b00000000000000000000000000000000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert 0 to float");
   __display("float is  %b ", out);
   __display("should be 00000000000000000000000000000000 ");

   __display("");
  }
  in1 = -16506060;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b11001011011110111101110011001100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert -16506060 to float");
   __display("float is  %b ", out);
   __display("should be 11001011011110111101110011001100 ");

   __display("");
  }
  in1 = -12339038;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b11001011001111000100011101011110){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert -12339038 to float");
   __display("float is  %b ", out);
   __display("should be 11001011001111000100011101011110 ");

   __display("");
  }
  in1 = 4326239;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b01001010100001000000011010111110){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert 4326239 to float");
   __display("float is  %b ", out);
   __display("should be 01001010100001000000011010111110 ");

   __display("");
  }
  in1 = 8880682;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b01001011000001111000001000101010){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert 8880682 to float");
   __display("float is  %b ", out);
   __display("should be 01001011000001111000001000101010 ");

   __display("");
  }
  in1 = -13467788;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b11001011010011011000000010001100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert -13467788 to float");
   __display("float is  %b ", out);
   __display("should be 11001011010011011000000010001100 ");

   __display("");
  }
  in1 = 127412750;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b01001100111100110000010101000010){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert 127412750 to float");
   __display("float is  %b ", out);
   __display("should be 01001100111100110000010101000010 ");

   __display("");
  }
  in1 = 216428019;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b01001101010011100110011011011111){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert 216428019 to float");
   __display("float is  %b ", out);
   __display("should be 01001101010011100110011011011111 ");

   __display("");
  }
  in1 = -426212671;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b11001101110010110011101111101010){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert -426212671 to float");
   __display("float is  %b ", out);
   __display("should be 11001101110010110011101111101010 ");

   __display("");
  }
  in1 = -305841417;
  wr =1;
  funct = 4;
  while(busy){}
  if(out == 32b11001101100100011101011000101000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to convert -305841417 to float");
   __display("float is  %b ", out);
   __display("should be 11001101100100011101011000101000 ");

   __display("");
  }
  in1 = 32b11001010110110001000100110101110;
  in2 = 32b11001010100100000110000001001010;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b11001011001101000111010011111100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -7095511 and -4730917");
   __display("float is  %b ", out);
   __display("should be 11001011001101000111010011111100 ");

   __display("");
  }
  in1 = 32b01001011010100000101100101010001;
  in2 = 32b11001011000110101100010010001001;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b01001010010101100101001100100000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 13654353 and -10142857");
   __display("float is  %b ", out);
   __display("should be 01001010010101100101001100100000 ");

   __display("");
  }
  in1 = 32b11001011000011111101001100110011;
  in2 = 32b11001010100010010110111001011000;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b11001011010101001000101001011111){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -9425715 and -4503340");
   __display("float is  %b ", out);
   __display("should be 11001011010101001000101001011111 ");

   __display("");
  }
  in1 = 32b11001011011010000101011011010111;
  in2 = 32b11000111111101000111111010000000;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b11001011011010100011111111010100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -15226583 and -125181");
   __display("float is  %b ", out);
   __display("should be 11001011011010100011111111010100 ");

   __display("");
  }
  in1 = 32b11001011001010110001110011011101;
  in2 = 32b11001011000010100100011100000100;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b11001011100110101011000111110000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -11214045 and -9062148");
   __display("float is  %b ", out);
   __display("should be 11001011100110101011000111110000 ");

   __display("");
  }
  in1 = 32b11001010001010000011011010000100;
  in2 = 32b01001010101111001000010000110110;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b01001010010100001101000111101000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -2756001 and 6177307");
   __display("float is  %b ", out);
   __display("should be 01001010010100001101000111101000 ");

   __display("");
  }
  in1 = 32b01001011000110101101111101011001;
  in2 = 32b11001000101010001110111010100000;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b01001011000101011001011111100100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 10149721 and -345973");
   __display("float is  %b ", out);
   __display("should be 01001011000101011001011111100100 ");

   __display("");
  }
  in1 = 32b11000111100011001101010100000000;
  in2 = 32b11001010110011110011100110110100;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b11001010110100010110110100001000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -72106 and -6790362");
   __display("float is  %b ", out);
   __display("should be 11001010110100010110110100001000 ");

   __display("");
  }
  in1 = 32b11001010100010011101011101011010;
  in2 = 32b11001010110011100001100100110110;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b11001011001010111111100001001000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -4516781 and -6753435");
   __display("float is  %b ", out);
   __display("should be 11001011001010111111100001001000 ");

   __display("");
  }
  in1 = 32b01001000110100011000011001000000;
  in2 = 32b11001011010010100010110101000011;
  wr =1;
  funct = 0;
  while(busy){}
  if(out == 32b11001011010000111010000100010001){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 429106 and -13249859");
   __display("float is  %b ", out);
   __display("should be 11001011010000111010000100010001 ");

   __display("");
  }
  in1 = 32b11001010100111110111101100111010;
  in2 = 32b11001011001001101010101110001001;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001010101011011101101111011000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -5225885 and 10922889");
   __display("float is  %b ", out);
   __display("should be 01001010101011011101101111011000 ");

   __display("");
  }
  in1 = 32b01001001001011101011100100110000;
  in2 = 32b11001010111111100100000110010000;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001011000010100000110001011011){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 715667 and 8331464");
   __display("float is  %b ", out);
   __display("should be 01001011000010100000110001011011 ");

   __display("");
  }
  in1 = 32b01001010000110100101110110001000;
  in2 = 32b11001011010110100000111111111100;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001011100000000101001110101111){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 2529122 and 14290940");
   __display("float is  %b ", out);
   __display("should be 01001011100000000101001110101111 ");

   __display("");
  }
  in1 = 32b11001010101001001010010000000110;
  in2 = 32b11001010110110101010101101111100;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001001110110000001110111011000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -5394947 and 7165374");
   __display("float is  %b ", out);
   __display("should be 01001001110110000001110111011000 ");

   __display("");
  }
  in1 = 32b01001001100111011101000010110000;
  in2 = 32b11001010010110000001101110011000;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001010100100111000000111111000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 1292822 and 3540710");
   __display("float is  %b ", out);
   __display("should be 01001010100100111000000111111000 ");

   __display("");
  }
  in1 = 32b11001011010010010110010011010000;
  in2 = 32b11001011011101001010101001111111;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001010001011010001011010111100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -13198544 and 16034431");
   __display("float is  %b ", out);
   __display("should be 01001010001011010001011010111100 ");

   __display("");
  }
  in1 = 32b11001010111100111101011110001010;
  in2 = 32b01001011000100110011010101100111;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b11001011100001101001000010010110){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -7990213 and -9647463");
   __display("float is  %b ", out);
   __display("should be 11001011100001101001000010010110 ");

   __display("");
  }
  in1 = 32b01001011000001100100110100111010;
  in2 = 32b11001011000111111011011011011001;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001011100100110000001000001010){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 8801594 and 10467033");
   __display("float is  %b ", out);
   __display("should be 01001011100100110000001000001010 ");

   __display("");
  }
  in1 = 32b01001011011101001111011011101010;
  in2 = 32b11001011010100001000100001010111;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b01001011111000101011111110100000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add 16053994 and 13666391");
   __display("float is  %b ", out);
   __display("should be 01001011111000101011111110100000 ");

   __display("");
  }
  in1 = 32b11001001110110100001101010000000;
  in2 = 32b01001010100101010011000011011010;
  wr =1;
  funct = 1;
  while(busy){}
  if(out == 32b11001010110010111011011101111010){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to add -1786704 and -4888685");
   __display("float is  %b ", out);
   __display("should be 11001010110010111011011101111010 ");

   __display("");
  }
  in1 = 32b01000110011101000111000000000000;
  in2 = 32b01000001100010000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b01001000100000011101101110000000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply 15644 and 17");
   __display("float is  %b ", out);
   __display("should be 01001000100000011101101110000000 ");

   __display("");
  }
  in1 = 32b01001001011100100010000010100000;
  in2 = 32b11000001100010000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b11001011100000001010000101010101){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply 991754 and -17");
   __display("float is  %b ", out);
   __display("should be 11001011100000001010000101010101 ");

   __display("");
  }
  in1 = 32b11001001001000010100110001100000;
  in2 = 32b11000001100100000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b01001011001101010111010111101100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply -660678 and -18");
   __display("float is  %b ", out);
   __display("should be 01001011001101010111010111101100 ");

   __display("");
  }
  in1 = 32b11001001010110111111101110010000;
  in2 = 32b11000010000110000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b01001100000000101001110101011110){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply -901049 and -38");
   __display("float is  %b ", out);
   __display("should be 01001100000000101001110101011110 ");

   __display("");
  }
  in1 = 32b11001001001110110111110010000000;
  in2 = 32b01000010001101000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b11001100000000111101001110001010){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply -767944 and 45");
   __display("float is  %b ", out);
   __display("should be 11001100000000111101001110001010 ");

   __display("");
  }
  in1 = 32b01001001001001011100001100100000;
  in2 = 32b11000000110000000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b11001010011110001010010010110000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply 678962 and -6");
   __display("float is  %b ", out);
   __display("should be 11001010011110001010010010110000 ");

   __display("");
  }
  in1 = 32b11000111000000111110010000000000;
  in2 = 32b01000001011000000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b11001000111001101100111100000000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply -33764 and 14");
   __display("float is  %b ", out);
   __display("should be 11001000111001101100111100000000 ");

   __display("");
  }
  in1 = 32b01001000111011000110110000000000;
  in2 = 32b01000010000011000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b01001011100000010100101100010000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply 484192 and 35");
   __display("float is  %b ", out);
   __display("should be 01001011100000010100101100010000 ");

   __display("");
  }
  in1 = 32b11001001010110000000001110110000;
  in2 = 32b11000001101100000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b01001011100101001000001010001001){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply -884795 and -22");
   __display("float is  %b ", out);
   __display("should be 01001011100101001000001010001001 ");

   __display("");
  }
  in1 = 32b01001001010100000100010000000000;
  in2 = 32b11000010001101000000000000000000;
  wr =1;
  funct = 2;
  while(busy){}
  if(out == 32b11001100000100100110111111010000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to multiply 853056 and -45");
   __display("float is  %b ", out);
   __display("should be 11001100000100100110111111010000 ");

   __display("");
  }
  in1 = 32b01001000000101011011101100000000;
  in2 = 32b01001001010000000001101110000000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b00111110010001111000011101101100){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div 153324 by 786872");
   __display("float is  %b ", out);
   __display("should be 00111110010001111000011101101100 ");

   __display("");
  }
  in1 = 32b01001001011010011111110000000000;
  in2 = 32b01001001001010101111110101100000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b00111111101011110010100000011110){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div 958400 by 700374");
   __display("float is  %b ", out);
   __display("should be 00111111101011110010100000011110 ");

   __display("");
  }
  in1 = 32b01001001000010010001011100010000;
  in2 = 32b01001001000110010000010011110000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b00111111011001010101100111000000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div 561521 by 626767");
   __display("float is  %b ", out);
   __display("should be 00111111011001010101100111000000 ");

   __display("");
  }
  in1 = 32b11001000100101000111110001100000;
  in2 = 32b11001001011011010000000111110000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b00111110101000000110001001111000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div -304099 by -970783");
   __display("float is  %b ", out);
   __display("should be 00111110101000000110001001111000 ");

   __display("");
  }
  in1 = 32b11001001001100100110010100100000;
  in2 = 32b01001001001100001110100100100000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b10111111100000010001001011110001){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div -730706 by 724626");
   __display("float is  %b ", out);
   __display("should be 10111111100000010001001011110001 ");

   __display("");
  }
  in1 = 32b11001000110111110001100000000000;
  in2 = 32b11001001010001011100100100010000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b00111111000100000110000011110011){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div -456896 by -810129");
   __display("float is  %b ", out);
   __display("should be 00111111000100000110000011110011 ");

   __display("");
  }
  in1 = 32b11001001000111000010000011000000;
  in2 = 32b01001000000101101000101011000000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b11000000100001001011111111100000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div -639500 by 154155");
   __display("float is  %b ", out);
   __display("should be 11000000100001001011111111100000 ");

   __display("");
  }
  in1 = 32b11001000110110010010000001000000;
  in2 = 32b11001000001011111011101000000000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b01000000000111100010011111010000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div -444674 by -179944");
   __display("float is  %b ", out);
   __display("should be 01000000000111100010011111010000 ");

   __display("");
  }
  in1 = 32b01001001001110100001010000000000;
  in2 = 32b01001000010100011110001010000000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b01000000011000101111011001101111){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div 762176 by 214922");
   __display("float is  %b ", out);
   __display("should be 01000000011000101111011001101111 ");

   __display("");
  }
  in1 = 32b01001000111001011100100001000000;
  in2 = 32b01001000111101010100100010100000;
  wr =1;
  funct = 3;
  while(busy){}
  if(out == 32b00111111011011111101001001000000){
    __display("PASSED");
    __display("");
  }else{
   __display("FAILED");
   __display("failed to div 470594 by 502341");
   __display("float is  %b ", out);
   __display("should be 00111111011011111101001001000000 ");

   __display("");
  }
}
