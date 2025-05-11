using System.Collections.Generic;

namespace DragonBones
{
	public class UserData : BaseObject
	{
		public readonly List<int> ints;

		public readonly List<float> floats;

		public readonly List<string> strings;

		protected override void _OnClear()
		{
		}

		internal void AddInt(int value)
		{
		}

		internal void AddFloat(float value)
		{
		}

		internal void AddString(string value)
		{
		}

		public int GetInt(int index = 0)
		{
			return 0;
		}

		public float GetFloat(int index = 0)
		{
			return 0f;
		}

		public string GetString(int index = 0)
		{
			return null;
		}
	}
}
