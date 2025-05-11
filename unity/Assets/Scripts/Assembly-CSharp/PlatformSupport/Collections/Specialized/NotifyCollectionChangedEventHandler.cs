using System.Runtime.InteropServices;

namespace PlatformSupport.Collections.Specialized
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void NotifyCollectionChangedEventHandler(object sender, NotifyCollectionChangedEventArgs e);
}
