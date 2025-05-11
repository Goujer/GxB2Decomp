void __noreturn _cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  __int64 globals; // x22
  __int64 terminate; // x0

  globals = __cxa_get_globals();
  *((_QWORD *)a1 - 13) = std::get_unexpected();
  terminate = std::get_terminate();
  *((_QWORD *)a1 - 4) = 0x434C4E47432B2B00LL;
  a1 = (char *)a1 - 32;
  *((_QWORD *)a1 - 8) = terminate;
  *((_QWORD *)a1 - 12) = 1LL;
  *((_QWORD *)a1 - 11) = lptinfo;
  *((_QWORD *)a1 - 10) = a3;
  ++*(_DWORD *)(globals + 8);
  *((_QWORD *)a1 + 1) = &loc_8E4C0;
  _Unwind_RaiseException();
  __cxa_begin_catch(a1);
  sub_8EC38(*((_QWORD *)a1 - 8));
}
