// attributes: thunk
void __fastcall std::exception::~exception(std::exception *this)
{
  operator delete(this);
}
