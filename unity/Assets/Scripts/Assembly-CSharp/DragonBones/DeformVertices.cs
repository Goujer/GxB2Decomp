using System.Collections.Generic;

namespace DragonBones
{
	public class DeformVertices : BaseObject
	{
		public bool verticesDirty;

		public readonly List<float> vertices;

		public readonly List<Bone> bones;

		public VerticesData verticesData;

		protected override void _OnClear()
		{
		}

		public void init(VerticesData verticesDataValue, Armature armature)
		{
		}

		public bool isBonesUpdate()
		{
			return false;
		}
	}
}
