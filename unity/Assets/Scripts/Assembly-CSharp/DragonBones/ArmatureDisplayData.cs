using System.Collections.Generic;

namespace DragonBones
{
	public class ArmatureDisplayData : DisplayData
	{
		public bool inheritAnimation;

		public readonly List<ActionData> actions;

		public ArmatureData armature;

		protected override void _OnClear()
		{
		}

		internal void AddAction(ActionData value)
		{
		}
	}
}
