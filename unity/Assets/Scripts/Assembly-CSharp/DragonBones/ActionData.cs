namespace DragonBones
{
	public class ActionData : BaseObject
	{
		public ActionType type;

		public string name;

		public BoneData bone;

		public SlotData slot;

		public UserData data;

		protected override void _OnClear()
		{
		}
	}
}
