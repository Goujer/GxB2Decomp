using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace BestHTTP
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnHeaderEnumerationDelegate(string header, List<string> values);
}
