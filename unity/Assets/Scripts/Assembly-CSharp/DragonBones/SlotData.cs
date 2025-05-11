namespace DragonBones
{
	public class SlotData : BaseObject
	{
		public static readonly ColorTransform DEFAULT_COLOR;

		public BlendMode blendMode;

		public int displayIndex;

		public int zOrder;

		public string name;

		public ColorTransform color;

		public UserData userData;

		public BoneData parent;

		public static ColorTransform CreateColor()
		{
			return null;
		}

		protected override void _OnClear()
		{
		}
	}
}
