// attributes: thunk
void __fastcall std::bad_array_length::~bad_array_length(std::bad_array_length *this)
{
  operator delete(this);
}
