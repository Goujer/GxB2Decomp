using System.Collections.Generic;

namespace DragonBones
{
	public class PathDisplayData : DisplayData
	{
		public bool closed;

		public bool constantSpeed;

		public readonly VerticesData vertices;

		public readonly List<float> curveLengths;

		protected override void _OnClear()
		{
		}
	}
}
