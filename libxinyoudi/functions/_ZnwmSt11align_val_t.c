void *__fastcall operator new(size_t a1, unsigned __int64 a2)
{
  unsigned __int64 StatusReg; // x21
  size_t v3; // x19
  size_t v4; // x20
  void (*new_handler)(void); // x0
  std::bad_alloc *exception; // x19
  void *v8[2]; // [xsp+0h] [xbp-30h] BYREF

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  if ( a1 )
    v3 = a1;
  else
    v3 = 1LL;
  if ( a2 <= 8 )
    v4 = 8LL;
  else
    v4 = a2;
  v8[1] = *(void **)(StatusReg + 40);
  while ( posix_memalign(v8, v4, v3) )
  {
    new_handler = (void (*)(void))std::get_new_handler();
    if ( !new_handler )
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      std::bad_alloc::bad_alloc(exception);
      __cxa_throw(
        exception,
        (struct type_info *)&`typeinfo for'std::bad_alloc,
        (void (*)(void *))std::exception::~exception);
    }
    new_handler();
  }
  return v8[0];
}
