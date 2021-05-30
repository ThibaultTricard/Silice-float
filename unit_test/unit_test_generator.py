import struct
import random

def binary(num):
    return ''.join('{:0>8b}'.format(c) for c in struct.pack('!f', num))


def to_float_unit_test(num):
	s =     "  in1 = "+str(num)+";\n"
	s = s + "  wr =1;\n"
	s = s + "  funct = 4;\n"
	s = s + "  while(busy){}\n"
	s = s + "  if(out == 32b"+binary(num)+"){\n"
	s = s + "    __display(\"PASSED\");\n"
#	s = s + "    __display(\" %d  = "+binary(num)+"\" , out);\n"
	s = s + "    __display(\"\");\n"
	s = s + "  }else{\n"
	s = s + "   __display(\"FAILED\");\n"
	s = s + "   __display(\"failed to convert "+ str(num) +" to float\");\n"
	s = s + "   __display(\"float is  %b \", out);\n"
	s = s + "   __display(\"should be "+binary(num)+" \");\n\n"
	s = s + "   __display(\"\");\n"
	s = s + "  }\n"
	return s

def float_plus_float_unit_test(num1, num2):
	s =     "  in1 = 32b"+binary(num1)+";\n"
	s = s + "  in2 = 32b"+binary(num2)+";\n"
	s = s + "  wr =1;\n"
	s = s + "  funct = 0;\n"
	s = s + "  while(busy){}\n"
	s = s + "  if(out == 32b"+binary(float(num1)+float(num2))+"){\n"
	s = s + "    __display(\"PASSED\");\n"
#	s = s + "    __display(\" %d  = "+binary(num1)+"\" , out);\n"
	s = s + "    __display(\"\");\n"
	s = s + "  }else{\n"
	s = s + "   __display(\"FAILED\");\n"
	s = s + "   __display(\"failed to add "+ str(num1) +" and "+ str(num2)+"\");\n"
	s = s + "   __display(\"float is  %b \", out);\n"
	s = s + "   __display(\"should be "+binary(float(num1)+float(num2))+" \");\n\n"
	s = s + "   __display(\"\");\n"
	s = s + "  }\n"
	return s


def float_minus_float_unit_test(num1, num2):
	s =     "  in1 = 32b"+binary(num1)+";\n"
	s = s + "  in2 = 32b"+binary(num2)+";\n"
	s = s + "  wr =1;\n"
	s = s + "  funct = 1;\n"
	s = s + "  while(busy){}\n"
	s = s + "  if(out == 32b"+binary(float(num1)-float(num2))+"){\n"
	s = s + "    __display(\"PASSED\");\n"
#	s = s + "    __display(\" %d  = "+binary(num1)+"\" , out);\n"
	s = s + "    __display(\"\");\n"
	s = s + "  }else{\n"
	s = s + "   __display(\"FAILED\");\n"
	s = s + "   __display(\"failed to add "+ str(num1) +" and "+ str(-num2)+"\");\n"
	s = s + "   __display(\"float is  %b \", out);\n"
	s = s + "   __display(\"should be "+binary(float(num1)-float(num2))+" \");\n\n"
	s = s + "   __display(\"\");\n"
	s = s + "  }\n"
	return s


def float_times_float_unit_test(num1, num2):
	s =     "  in1 = 32b"+binary(num1)+";\n"
	s = s + "  in2 = 32b"+binary(num2)+";\n"
	s = s + "  wr =1;\n"
	s = s + "  funct = 2;\n"
	s = s + "  while(busy){}\n"
	s = s + "  if(out == 32b"+binary(float(num1)*float(num2))+"){\n"
	s = s + "    __display(\"PASSED\");\n"
#	s = s + "    __display(\" %d  = "+binary(num1)+"\" , out);\n"
	s = s + "    __display(\"\");\n"
	s = s + "  }else{\n"
	s = s + "   __display(\"FAILED\");\n"
	s = s + "   __display(\"failed to multiply "+ str(num1) +" and "+ str(num2)+"\");\n"
	s = s + "   __display(\"float is  %b \", out);\n"
	s = s + "   __display(\"should be "+binary(float(num1)*float(num2))+" \");\n\n"
	s = s + "   __display(\"\");\n"
	s = s + "  }\n"
	return s


def float_div_float_unit_test(num1, num2):
	s =     "  in1 = 32b"+binary(num1)+";\n"
	s = s + "  in2 = 32b"+binary(num2)+";\n"
	s = s + "  wr =1;\n"
	s = s + "  funct = 3;\n"
	s = s + "  while(busy){}\n"
	s = s + "  if(out == 32b"+binary(float(num1)/float(num2))+"){\n"
	s = s + "    __display(\"PASSED\");\n"
#	s = s + "    __display(\" %d  = "+binary(num1)+"\" , out);\n"
	s = s + "    __display(\"\");\n"
	s = s + "  }else{\n"
	s = s + "   __display(\"FAILED\");\n"
	s = s + "   __display(\"failed to div "+ str(num1) +" by "+ str(num2)+"\");\n"
	s = s + "   __display(\"float is  %b \", out);\n"
	s = s + "   __display(\"should be "+binary(float(num1)/float(num2))+" \");\n\n"
	s = s + "   __display(\"\");\n"
	s = s + "  }\n"
	return s


f = open("unit_test.ice", "w")


f.write("$include('../src/float_def.ice')\n")
f.write("$$uint_size = 32\n")
f.write("$$int_size = 32\n")
f.write("$include('../src/FPU_module.ice')\n")


f.write("algorithm main(output uint8 leds){\n")

f.write("// initialisation\n")

f.write("  uint$float_size$ in1 = uninitialized;\n  uint$float_size$ in2 = uninitialized;\n  uint$float_size$ out = uninitialized;\n  uint3            funct = uninitialized;\n  uint1            wr = uninitialized;\n  uint1            busy = uninitialized;\n\n")

f.write("  FPU_module FPU(\n")
f.write("      in1   <: in1,\n")
f.write("      in2   <: in2,\n")
f.write("      out   :> out,\n")
f.write("      funct <: funct,\n")
f.write("      wr    <: wr,\n")
f.write("      busy  :> busy,\n")
f.write("  );\n")

f.write("  wr ::= 0;\n\n")

f.write("// uint_to_float\n")
f.write("  funct = 4;\n")

f.write(to_float_unit_test(0))


for i in range(5) :
	f.write(to_float_unit_test(random.randint(-16777215,16777215)))

for i in range(2) :
	f.write(to_float_unit_test(random.randint(1,2147483647)))

for i in range(2) :
	f.write(to_float_unit_test(random.randint(-2147483647,-1)))

for i in range(10) :
	f.write(float_plus_float_unit_test(random.randint(-16777215,16777215),random.randint(-16777215,16777215)))

for i in range(10) :
	f.write(float_minus_float_unit_test(random.randint(-16777215,16777215),random.randint(-16777215,16777215)))

for i in range(10) :
	f.write(float_times_float_unit_test(random.randint(-1048576,1048576),random.randint(-50,50)))

for i in range(10) :
	f.write(float_div_float_unit_test(random.randint(-1048576,1048576),random.randint(-1048576,1048576)))


f.write("}\n")
f.close()