// attributes: thunk
void __fastcall std::bad_exception::~bad_exception(std::bad_exception *this)
{
  operator delete(this);
}
