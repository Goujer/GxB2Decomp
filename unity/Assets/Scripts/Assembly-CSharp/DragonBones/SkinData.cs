using System.Collections.Generic;

namespace DragonBones
{
	public class SkinData : BaseObject
	{
		public string name;

		public readonly Dictionary<string, List<DisplayData>> displays;

		public ArmatureData parent;

		protected override void _OnClear()
		{
		}

		public void AddDisplay(string slotName, DisplayData value)
		{
		}

		public DisplayData GetDisplay(string slotName, string displayName)
		{
			return null;
		}

		public List<DisplayData> GetDisplays(string slotName)
		{
			return null;
		}
	}
}
