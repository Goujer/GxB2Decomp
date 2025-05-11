void __noreturn _cxa_call_unexpected(void *a1)
{
  void (*unexpected)(void); // x0
  __int64 v3; // [xsp+38h] [xbp-78h]

  if ( !a1 )
    sub_8F4D0(0, 0LL);
  __cxa_begin_catch(a1);
  if ( (*(_QWORD *)a1 & 0xFFFFFFFFFFFFFF00LL) == 0x434C4E47432B2B00LL )
  {
    unexpected = (void (*)(void))*((_QWORD *)a1 - 9);
    v3 = *((_QWORD *)a1 - 4);
  }
  else
  {
    std::get_terminate();
    unexpected = (void (*)(void))std::get_unexpected();
  }
  sub_8EBE8(unexpected);
}
