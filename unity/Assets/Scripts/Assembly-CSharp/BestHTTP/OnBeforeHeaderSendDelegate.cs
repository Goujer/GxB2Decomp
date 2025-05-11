using System.Runtime.InteropServices;

namespace BestHTTP
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnBeforeHeaderSendDelegate(HTTPRequest req);
}
