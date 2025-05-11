using System.Collections.Generic;

namespace DragonBones
{
	public class DragonBonesData : BaseObject
	{
		public bool autoSearch;

		public uint frameRate;

		public string version;

		public string name;

		public ArmatureData stage;

		public readonly List<uint> frameIndices;

		public readonly List<float> cachedFrames;

		public readonly List<string> armatureNames;

		public readonly Dictionary<string, ArmatureData> armatures;

		internal byte[] binary;

		internal short[] intArray;

		internal float[] floatArray;

		internal short[] frameIntArray;

		internal float[] frameFloatArray;

		internal short[] frameArray;

		internal ushort[] timelineArray;

		internal UserData userData;

		protected override void _OnClear()
		{
		}

		public void AddArmature(ArmatureData value)
		{
		}

		public ArmatureData GetArmature(string armatureName)
		{
			return null;
		}
	}
}
