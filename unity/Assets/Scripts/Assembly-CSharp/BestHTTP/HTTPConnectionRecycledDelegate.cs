using System.Runtime.InteropServices;

namespace BestHTTP
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	internal delegate void HTTPConnectionRecycledDelegate(ConnectionBase conn);
}
