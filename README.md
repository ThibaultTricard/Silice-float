# Silice-float
Customizable floating point number lib for the [Silice FPGA language](https://github.com/sylefeb/Silice)

Using the Silice Draft branch

# Features
- int to float
- float to int
- float addition
- float multiplication
- float division
- FPU module

# How to use

first you need to include the float definition with : 

```
$include('/pathToSiliceFloat/src/float_def.ice')
```

Then define the size of an integer : 
```
$$int_size = 32
```
if you are using the FPU module make sure the int size match the size of the float you are using

## Using the FPU module

To be able to use the FPU module you need to include it in your project : 

```
$include('/pathToSiliceFloat/src/FPU_module.ice')
```

Then in your algorithm you need to declare it, there is multiple way to do that in Silice,
Personaly I use the following one : 

```
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
```

This way you can then call the FPU module by setting wr to 1 and setting up it's input,
and you know if the computation is done when the busy value goes to 0

You can pick the function you want to using the funct value : 
  - 0 will add in1 and in2 with a float addition and return it's value in the out value
  - 1 will substract in2 to in1 with a float substraction and return it's value in the out value
  - 2 will multiply in1 by in2 with a float multiplication and return it's value in the out value
  - 3 will divide in1 by in2 with a float division and return it's value in the out value
  - 4 will convert the value in in1 from an int to a float and return it in the out value
  - 5 will convert the value in in1 from a float to an int and return it in the out value
 
For example the addition can be called as following :

```
  in1 = 32b11001010110110001000100110101110; // a floating value
  in2 = 32b11001010100100000110000001001010; // another floating value
  wr =1;
  funct = 0;
  while(busy){}
  // now he out value should be the sum of in1 and in2
```

## Using Custom floating point
This lib has been made to handle customisable floating 
The default floating point contained in the float_def.ice file is the IEEE 754 32 bits float

To change that you can create your own float definition file by copying the float_def.ice file and changing the exonant_size and the mantissa_size.

for the IEEE 754 64 bit float, the file should look like that : 

```
$$if FLOAT_DEF == nil then
$$FLOAT_DEF = 1
//IEEE 754

$$exponant_size = 11
$$mantissa_size = 52


$$float_size = 1 + exponant_size + mantissa_size

bitfield float{
    uint1 sign,
    uint$exponant_size$ exponant,
    uint$mantissa_size$ fraction,
}

$$end
```

Then you can change the included float definition file by your own :

``` 
$include('pathtomyfloatdef/my_float.ice')
```
