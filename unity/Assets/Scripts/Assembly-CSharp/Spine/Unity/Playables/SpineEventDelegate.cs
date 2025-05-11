using System.Runtime.InteropServices;

namespace Spine.Unity.Playables
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SpineEventDelegate(Event e);
}
