using System;
using System.Runtime.InteropServices;

namespace BestHTTP.Futures
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void FutureErrorCallback(Exception error);
}
