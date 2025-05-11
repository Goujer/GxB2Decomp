using System.Runtime.InteropServices;

namespace HTMLEngine.Core
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	internal delegate bool ReaderDelegate(Reader reader);
}
