$$if FLOAT_DEF == nil then
$$FLOAT_DEF = 1
//IEEE 754

$$exponant_size = 8
$$mantissa_size = 23


$$float_size = 1 + exponant_size + mantissa_size

bitfield float{
    uint1 sign,
    uint$exponant_size$ exponant,
    uint$mantissa_size$ fraction,
}

$$end