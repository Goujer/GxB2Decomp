using System.Runtime.InteropServices;

namespace BestHTTP
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnUploadProgressDelegate(HTTPRequest originalRequest, long uploaded, long uploadLength);
}
