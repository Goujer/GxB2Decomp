using System.Runtime.InteropServices;

namespace HTMLEngine
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	internal delegate void ObjectPoolHandler(PoolableObject obj);
}
