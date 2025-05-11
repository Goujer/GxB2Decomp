using System.Collections.Generic;

namespace DragonBones
{
	public class WeightData : BaseObject
	{
		public int count;

		public int offset;

		public readonly List<BoneData> bones;

		protected override void _OnClear()
		{
		}

		internal void AddBone(BoneData value)
		{
		}
	}
}
