void *__fastcall operator new(size_t a1)
{
  size_t v1; // x19
  void *result; // x0
  void (*new_handler)(void); // x0
  std::bad_alloc *exception; // x19

  if ( a1 )
    v1 = a1;
  else
    v1 = 1LL;
  while ( 1 )
  {
    result = malloc(v1);
    if ( result )
      break;
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
  return result;
}
