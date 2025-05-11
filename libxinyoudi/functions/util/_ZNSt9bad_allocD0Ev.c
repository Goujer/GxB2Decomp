// attributes: thunk
void __fastcall std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
  operator delete(this);
}
