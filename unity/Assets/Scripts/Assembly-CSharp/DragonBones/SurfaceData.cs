using System.Collections.Generic;

namespace DragonBones
{
	public class SurfaceData : BoneData
	{
		public float vertexCountX;

		public float vertexCountY;

		public readonly List<float> vertices;

		protected override void _OnClear()
		{
		}
	}
}
